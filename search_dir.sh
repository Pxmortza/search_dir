#!/bin/bash
# coded by mortza
#thank you grand Teachar amirreza  Amirsamimi

#----------------------------------------

#Change this to whereever you choose to install the program
trap 'normalplease'  1 
BASEDIR="$HOME/search_dir"

#----------------------------------------
#start screen
clear
echo "Simple jobs mkdir..."

sleep 2
clear

#----------------------------------------

menu()
{

	exit="false"
	while [ $exit != "true" ]
	do
		clear
		echo "What would you like to do?"
		echo "1. create folder(in HOME url... display help screen)"
		echo "2. delete directory(if hasint in your system is folder)"
		echo "3. check this file has in your system or no.(no/yes)"
		echo "0.exit" Exit
		echo -n "Please enter your choice"

		read choice
		case $choice in
			0) exit="true" ;;
			1) creator ;;
			2) delete  ;;
			3) checker ;;
			*) echo "Please enter a valid choice";
		esac

		echo "Press Enter to continue"
		read
	done

}
if [ $# -lt 1 ]
then
	help
else
	do
	  case $Option in
	    h     ) help ; exit 0 ;;
        c     ) mode=Creator 
        d     ) mode=delete
        ?     ) mode=checker
	  esac
	done
fi

case $mode in
  "interactive"	) menu ;;
  "Creator"     ) Creator ;;
  "delete"		) deletefile ;;
esac
#----------------------------------------
#HELP SCREEN
help(){

echo "Usage: `basename $0`
-------------------------------------------- /n
[-h] [-c] [--delete] [-?] /n
h - display this help screen /n
c - create the folder[if not find the folder] /n
d - delete the directory /n
---------------------------------------------"

}

#----------------------------------------
#Creator,mkdir
Creator(){

    read -p "Pls enter a directory name: " directory
if [-d "$HOME"/$directory ];then
   echo "Directory existed"
else
   echo "ok,Starting mkdir for craete Folder $directory"
   mkdir "$directory"
   echo "done,exit..."
fi
}

#----------------------------------------
#simple Scripe(YES?)
#this checker only for Home directory(you can edit the [if,structure] to usage checker.)
checker(){

pwd /n 
ls /n
clear
    read -p "pls enter a directory name: " directory 
      if [ -d "$HOME/$directory" ];then
         echo "directory existed"
     else
        echo "directory not existed"
      fi
}

#----------------------------------------