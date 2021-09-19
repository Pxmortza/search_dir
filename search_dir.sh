#! /bin/bash
# coded by mortza
# thank you grand Teachar amirreza  Amirsamimi

#----------------------------------------

#Change this to whereever you choose to install the program
trap 'normalplease'  1 
BASEDIR="$HOME/search_dir"

#----------------------------------------

#Color theme
GREEN='\033[0;36m'

#----------------------------------------
#start screen
clear
echo "'$GREEN Simple jobs dir...'"

sleep 2
clear

#----------------------------------------

menu()
{

	exit="false"
	while [ $exit != "true" ]
	do
		clear
		echo   ${GREEN}"What would you like to do?"
		echo   ${GREEN}"1. create folder(in HOME url... display help screen)"
		echo   ${GREEN}"2. delete directory(if hasint in your system is folder)"
		echo   ${GREEN}"3. check this file has in your system or no.(no/yes)"
		echo   ${GREEN}"0.exit" Exit
		echo -n ${GREEN}"Please enter your choice"

		read choice
		case $choice in
			0) exit="true" ;;
			1) creator ;;
			2) delete  ;;
			3) checker ;;
			*) echo "'${GREEN}Please enter a valid choice'";
		esac

		echo "'${GREEN}Press Enter to continue'"
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

echo  "Usage: `basename $0`
-------------------------------------------- /n
 ${GREEN} [-h] [-c] [--delete] [-?] /n
 ${GREEN} h - display this help screen /n
 ${GREEN} c - create the folder[if not find the folder] /n
 ${GREEN} d - delete the directory /n
---------------------------------------------"

}

#----------------------------------------
#Creator,mkdir
Creator(){

    read -p "'$GREEN Pls enter a directory name: '" directory
if [-d "$HOME"/$directory ];then
   echo "'$GREEN Directory existed '"
else
   echo "'$GREEN ok,Starting mkdir for craete Folder $directory '"
   mkdir "$directory"
   echo "'$GREEN done,exit... '"
fi
}

#----------------------------------------
#simple Scripe(YES?)
#this checker only for Home directory(you can edit the [if,structure] to usage checker.)
checker(){

pwd /n 
ls /n
clear
    read -p "'$GREEN pls enter a directory name: '" directory 
      if [ -d "$HOME/$directory" ];then
         echo "'$GREEN directory existed '"
     else
        echo "'$GREEN directory not existed '"
      fi
}

#----------------------------------------
#rmdir
delete(){
	pwd 
	sleep 3
	clear
	read -p "'$GREEN pls enter a directory name: '" directory
	  if [ -d "$HOME/$directory" ];then
	     rmdir "$directory"
		       echo "'$GREEN done'"
		else  
		       echo "'$GREEN directory not found '"
	  fi
}

#----------------------------------------
#main call
main "${@}"

#----------------------------------------