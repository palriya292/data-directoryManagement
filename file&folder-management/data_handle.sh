clear
echo " "
echo "----Implementing Data & Directory Management----"
echo " "
ch=0 
while [ $ch -lt 11 ] 
do
	
	
	echo "Press the following for FOLDER operations :"
	echo "1) Create a new directory."
	echo "2) Modify a directory."
	echo "3) Navigate into directory."
	echo "4) Listing directories."
	echo " "
	echo "Press the following for FILE operations :"
	echo "5) Copy a File "
        echo "6) Remove a file "
        echo "7) Move a file"
	echo "8) rename a file"
	echo "9) Create a file "
	echo "10) Edit a file "
	echo " "
	echo "11) to display current directory"
	echo "12) Exit."
	echo "enter choice number : "
	read ch 

	case $ch in

	

	1) echo " "
	echo "---Creation of Directory---"
	echo " "
	echo "Enter the name of the directory:"
	read name 
	mkdir $name 
	;; 
	2) echo " "
	echo "---Modification of Directory---"
	echo " "
	echo "Enter the directory to be modified:"
	read orgdir 
	echo "Press the following to :"
	echo " "
	echo "1) Rename directory."
	echo "2) Copy directory to another."
	echo "3) Move directory."
	echo "4) Delete directory."
	echo "5) Exit from Modify Mode."
	read modch 

		case $modch in
		1) echo " "
		echo "---Rename a directory---"
		echo " "
		echo "Enter new name for the directory:"
		read newname 
		mv $orgdir $newname 
		;; 
		2) echo " "
		echo "---Copying a directory to another---"
		echo " "
		echo "Enter target directory:"
		read target 
		mkdir $target 
		cp -a $orgdir $target 
		;; 
		3) echo " "
		echo "---Moving a directory---"
		echo " "
		echo "Enter target directory:"
		read target 
		mkdir $target 
		mv $orgdir $target 
		;; 
		4) echo " "
		echo "---Deleting a directory---"
		echo " "
		rmdir $orgdir 
		;; 
		5) echo " "
		echo "---Exiting from modify mode---"
		echo " "
		exit
		;; 
		esac
	;; 
	3) 
	echo "---Navigation of Directory---"
	echo " "
	echo "Enter your choice for method of navigation :"
	echo "1) Go to Parent Directory. "
	echo "2) Navigate to specific directory."
	echo "3) Exit from Navigate Mode."
	read navch 
		
	case $navch in
		1) echo " "
		echo "---Parent Directory---"
		echo " "
		cd .. 
		pwd
		;; 
		2) echo " "
		echo "---Navigation to Specific Directory---"
		echo " "
		echo "Enter the target Path:"
		read path 
		cd $path 
		pwd
		;; 
		3) echo " "
		echo "---Exiting from Navigate Mode---"
		echo " "
		exit
		;; 
		esac
	;; 
	4) 
	echo "--- Listing of Directories---"
	echo " "
	echo "Enter your choice for method of listing :"
	echo "1) List of directories. "
	echo "2) List of directories and their details."
	echo "3) Exit from List Mode."
	read lisch 
		
	case $lisch in
		1) echo " "
		echo "---List of directories---"
		echo " "
		ls
		;; 
		2) echo " "
		echo "---Detailed List of directories---"
		echo " "
		ls -l 
		;; 
		3) echo " "
		echo "---Exiting from List Mode---"
		echo " "
		exit
		;; 
		esac
	;;
	5) echo "Enter File name to copy \c"
              read f1
              echo "Enter FIle name \c "
          read f2         
          if [ -f $f1 ]
          then
                  cp $f1 $f2
              else
                     echo "$f1 does not exist"
	      fi

		read -r -p "Would you like to continue  [Y/N] : " copyf
		case $copyf in
        		[yY])
               		 	echo -e "list of actions : ";;
        		[nN])
               			 echo -e "Skipped and exit script"
               		 	exit 1;;
        		*)
                	echo "Invalid Option"
                ;;
		esac
              ;;
	      
	       
	6) echo "Enter the File to be removed "
             read r1
             if [ -f $r1 ]
             then      
                   rm -i $r1
             else 
                  echo "$r1 file does not exist "
             fi
		
		read -r -p "Would you like to continue  [Y/N] : " removef
		case $removef in
        		[yY])
               		 	echo -e "list of actions : ";;
        		[nN])
               			 echo -e "Skipped and exit script"
               		 	exit 1;;
        		*)
                	echo "Invalid Option"
                ;;
		esac
             ;;
	     
	7)  echo "Enter File name to move \c"
            read f1
            echo "Enter destination \c "
            read f2
            if [ -f $f1 ]
             then 
                 if [ -d $f2 ]
                 then
                      mv $f1 $f2
                 fi
             else
                 echo "$f1 does not exist"
            fi
		
	    read -r -p "Would you like to continue  [Y/N] : " readf
	    case $readf in
        	[yY])
               		 echo -e "list of actions : ";;
        	[nN])
               		 echo -e "Skipped and exit script"
               		 exit 1;;
        	*)
                echo "Invalid Option"
                ;;
		esac
            ;;

	8)echo "Enter file name to rename"
          read f1
          echo "Enter new name of file"
          read f2
          mv $f1 $f2
          echo $f1" is renamed as "$f2;;
			
	  
	9)echo enter file_name press enter and write in file
	echo "after writing, to save terminate the program by CTRL+C"
   	read f
   	cat> $f;;

	10)echo "Enter any file to be editing "
                                             read f1
                                                     vi $f1;;
	11)echo "Current Dir is : "
  	pwd;;
	
	12)echo " "
	echo "---Exiting---"
	echo " "
	exit
	;;
	esac
done
