#!usr//bin/env bash

#Make a Notes folder for the user
cd ~
if [[ -d "Notes" ]]; then
	exists=True;
else
	mkdir Notes;
fi

#opening a note (It will create a new note if $notename is blank)
function readnote() { 
dir="$(pwd)";
me="$(whoami)";
read -p "Enter note name: " opennote; 
cd ~/Notes;
if [ -e $opennote ]; then
	gedit $opennote;
	
else
	clear;
	echo "No such note.";
	cd ~
	read -p "Do you want to create one?[Y/N]: " create;
	
fi
	if [ $create == "y" ] || [ $create == "Y" ] || [ $create == "yes" ] || [ $create == "YES" ] || [ $create == "Yes" ]; then
		newnote
	fi
	
clear;
cd $dir

}

#Read notes instantly via terminal
function quickread() {
	dir="$(pwd)";
	read -p "Enter note name: " quicknotename;
	cd ~/Notes
	if [ -e $quicknotename ]; then
		clear;
		cat $quicknotename
	
	else
		clear;
		echo "No such note.";
		cd ~	
fi
cd $dir
}

#A quick solution to users who want keeping notes instantly via terminal.
function quicknote() {
dir="$(pwd)"; 
me="$(whoami)";
cd ~/Notes;
read -p "Enter note name: " notename;
if [ -e $notename ]; then
	clear;
	echo "This note already exists.";
	cd ..
	read -p "Do you want to read it?[Y/N]: " readquicknote;
	
else
	touch $notename; 
	nano $notename; 
	cd $dir;
	clear;
	echo "Note created in Home/$me/Notes"; 
	echo "-----------------------------------"; 
		
fi

if [[ $readquicknote == "y" ]] || [[ $readquicknote == "Y" ]] || [[ $readquicknote == "yes" ]] || [[ $readquicknote == "YES" ]] || [[ $readquicknote == "Yes" ]]; then
	clear;
	cd ~/Notes
	cat $notename;
	cd $dir
fi
}


#writes notes using ubuntu's text-editor (gedit).
function newnote() { 
dir="$(pwd)";
cd ~/Notes; 
me="$(whoami)";
gedit; 
clear; 
cd $dir; 
echo "Note created in Home/$me/Notes"; 
echo "-----------------------------------"; 
}

#Delete notes from terminal
function delnote() {
	if [[ $1 == "-all" ]]; then
		dir="$(pwd)";
		cd ~/Notes
		me="$(whoami)";
		rm *
		clear;
		cd $dir;
		echo "All files deleted from Home/$me/Notes"; 
		echo "-------------------------------------";
	else
		dir="$(pwd)";
		cd ~/Notes
		me="$(whoami)";
		read -p "Enter the name of the note you want to delete: " delete
		if [ -e $delete ]; then
			rm $delete
			clear;
			cd $dir;
			echo "Note deleted from Home/$me/Notes"; 
			echo "-----------------------------------";
		else
			echo "No such file."
			cd ~;
	fi
fi
}

#list your notes via terminal. 
function listnotes() {
	if [ -z "$(ls -A ~/Notes)" ]; then
		echo "Your Notes folder is empty."
	else
		ls ~/Notes -t
	fi
}

#Help for new users
function shellnotes() {
 	if [[ $1 == "-v" ]]; then
		echo "Shellnotes version: 2.3"

	elif [[ $1 == "-r" ]]; then
		echo "Github repository: https://github.com/dmarakom6/shellnotes/blob/master/"

	elif [[ $1 == "-h" ]]; then
		less ~/.help;
		cd $dir;
	elif [[ $1 == "--help" ]]; then
		less ~/.help;
		cd $dir;
	fi
}
#Take info about a note
function noteinfo() {
	dir="$(pwd)"
	cd ~/Notes
	read -p "Enter note name: " notename;
	if [ -e $notename ]; then
		wc $notename;
		echo "(lines/words/chars/name)"
else
	echo "That note doesn't exist."
fi
cd $dir
}

#Help the  user find a specific Note in his note folder. If it's not there, he must have misplaced it.
function findnote() {
	dir="$(pwd)"
	me="$(whoami)"
	read -p "Enter note name: " notename;
	cd ~/Notes
	if [ -e $notename ]; then
		echo "File was found in your Notes folder."
	else
		echo "File was not found in your Notes folder, must be misplaced or renamed."
		echo "Try 'findmisplacednote' to find the original file."

	fi
	cd $dir		

}

#Find a misplaced note, not in the Notes folder.
function findmisplacednote() {
	read -p "Enter note name: " notename;
	echo "Possible locations: ";
	find ~/ -iname $notename -print 2>/dev/null;
}

#Rename a note.
function renamenote() {
	dir="$(pwd)"
	me="$(whoami)"
	cd ~/Notes
	read -p "Enter note name: " notename
	if [ -e $notename ]; then
		read -p "Enter new name: " newnotename
		if [ -e $newnotename ]; then
			echo "There is another note named '$newnotename' in your Notes folder."
		fi
		mv $notename $newnotename
		clear;
		echo "Note renamed from $notename to $newnotename in Home/$me/Notes"
		echo "-------------------------------------------------------------"

	else
		echo "This note does not exist."
	fi
	cd $dir;
}
