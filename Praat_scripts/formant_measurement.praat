# analyse_Lucie_V2.praat
# this is a praat script (6.2.12)
# it measures formant along a pretranscribed part of a recording.

#   input
# - sound data to be analysed
# - textgrid containing the vowels to be measured on the first tier (interval tier)

#   output
# - a table with formant measurements

################## output table ###################
Create Table with column names... formants_diphthongs 0 file diphthong f1_0 f1_5 f1_10 f1_15 f1_20 f1_25 f1_30 f1_35 f1_40 f1_45 f1_50 f1_55 f1_60 f1_65 f1_70 f1_75 f1_80 f1_85 f1_90 f1_95 f1_100 f2_0 f2_5 f2_10 f2_15 f2_20 f2_25 f2_30 f2_35 f2_40 f2_45 f2_50 f2_55 f2_60 f2_65 f2_70 f2_75 f2_80 f2_85 f2_90 f2_95 f2_100 f3_0 f3_5 f3_10 f3_15 f3_20 f3_25 f3_30 f3_35 f3_40 f3_45 f3_50 f3_55 f3_60 f3_65 f3_70 f3_75 f3_80 f3_85 f3_90 f3_95 f3_100


################# Form #####################

# This form is for the basic settings applying to all the data
form Basic settings
    comment Directory of sound and textgrid files with final slash:
    # do not forget the trailing slash for the script to work!
    text directory: E:\My Praat data\
    
    comment the TextGrids must be in the same directory for the script to work. 

    comment Overwrite existing output files or append?
    boolean Overwrite_output_files 0
    ;comment diphthong to be analysed (indicate exact TextGrid label)
    ;text diphtong: ""
endform

################# end Form #####################


    #some information to be gathered so several recordings can be analysed

Create Strings as file list... Liste 'directory$'*.wav
numberOfFiles = Get number of strings

        # analyse each data
for ifile from 1 to numberOfFiles
    select Strings Liste
    fileName$ = Get string... ifile
    name$ = fileName$ - ".wav"
    Read from file... 'directory$''name$'.TextGrid
    Read from file... 'directory$''name$'.wav
    To Formant (burg): 0.005, 5, 5000, 0.025, 50.0
		# the parameters of the formant objects are, in order: time step, Nb of formants, ceiling, window length, pre-emphasis
    select TextGrid 'name$'
    interval = Get number of intervals: 1

        # analyse each interval 
    for i from 1 to interval  
		select TextGrid 'name$'
		label$ = Get label of interval: 1, i
	
		if label$ <> ""
		# if label$  = diphtong
		# the second if condition is to be used in case ony one label is to be analysed.
			begin = Get start time of interval: 1, i
			end = Get end time of interval: 1, i
	
				# add a row to the table for the new diphthong
			select Table formants_diphthongs
			Append row
			last_row_vowels = Get number of rows
			Set string value: last_row_vowels, "file", name$
			Set string value: last_row_vowels, "diphthong", label$
	
					# measure each formant every 5% of total duration
			for per20 from 0 to 20
				percent = per20 * 5
				time_'percent' = begin + percent*(end-begin)/100
				f1_current$ = "f1_'percent'"
				f2_current$ = "f2_'percent'"
				f3_current$ = "f3_'percent'"
				select Formant 'name$'
				f1 = Get value at time: 1, time_'percent', "Hertz", "Linear"
				f2 = Get value at time: 2, time_'percent', "Hertz", "Linear"
				f3 = Get value at time: 3, time_'percent', "Hertz", "Linear"
	
					# Writing the values in the table
				select Table formants_diphthongs
				if f1 <> undefined
					Set numeric value: last_row_vowels, f1_current$, 'f1:2'
				else
					Set string value: last_row_vowels, f1_current$, "undefined"
				endif 
	
				if f2 <> undefined
				Set numeric value: last_row_vowels, f2_current$, 'f2:2'
				else
					Set string value: last_row_vowels, f2_current$, "undefined"
					Set string value: last_row_vowels, f2_current$, "undefined"
				endif 
	
				if f3 <> undefined
					Set numeric value: last_row_vowels, f3_current$, 'f3:2'
				endif 
			endfor
		endif
	endfor
        # the data is now ready and can be removed from the object window
    select TextGrid 'name$'
    plus Sound 'name$'
    plus Formant 'name$'
    Remove
endfor 

    # removing the list
select Strings Liste
Remove

    # saving the final table
#    selec Table formants_diphthongs
#Save as tb-separated file

    # show the final table
select Table formants_diphthongs
View & Edit