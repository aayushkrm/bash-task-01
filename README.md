#Task #1.



 



##Write a script renaming files by inserting a suffix to the file name before the file's extension. For example, if the suffix is "sfx", the renaming should be done in the following way: 



 


```
"a" -> "asfx"



"a.txt" -> "asfx.txt"



"abc.doc" -> "abcsfx.doc"



"abc.txt.doc" -> "abc.txtsfx.doc"
```


 



, etc. The suffix is the first script argument followed by the renamed file list. Syntax:



 


`./insert_suffix [-d] [-v] [-h] [--] sfx files...`



 



 The script should support the following options (keys):


```
 -h print help message (usage, command syntax, supported options, and arguments)



 -d "dry run", print old and new file names without actual renaming



 -v print old and new names of renamed files (without the options script act silently)



 -- option and suffix/file names separator
 ```



 Take into account that filenames and the suffix may contain shell metacharacters including wildcards and start with a minus sign char (-).



 Execution examples:


```
./insert_suffix -d sfx file*.txt



(add sfx as a suffix to all files in current directory with .txt extension, dry run)


./insert_suffix -v sfx -- *



(add sfx as a suffix to all files in the current directory, verbose run, make sure that files started with - are also renamed correctly)


./insert_suffix -- -v *
```

(add -v as a suffix to all files in the current directory, silent run, make sure that files started with - are also renamed correctly) and so on.

The script should correctly handle argument and option syntax errors (absence of the suffix or filenames, incorrect options, etc, printing a corresponding error message to the error stream and stopping execution with non-zero status).

Additionally, you may

-check for renaming errors (e.g. file not found, no permission, and so on, maybe done in the most reliable way by checking "mv" exit status, also pre-check by test/[/[[ command to find the actual reason is also possible);
	
-add an option to change the default in case of files with "double" (or more) extensions (what to treat as an extension, the part of the name of the file after last or after the first occurrence of the dot (period) character?
	
-add an option for interactive mode (i.e. confirm each file renaming, ask in what place to put suffix);
	
-handle a situation when a file without extension is given by a relative or absolute path and some path's directory names do contain an extension (without handling it separately, the script would fail in this case)
	
and other improvements.

