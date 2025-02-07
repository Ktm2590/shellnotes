:<<'info'
shellnotes - l.sh
(C) Dimitris Marakomihelakis
Released under the "All rights reserved" category. See the RIGHTS.txt file
in /docs/github/ for its full text.
info

case $1 in -l|--logs )
	clear
	echo "Please select a logfile to open"
	echo "-------------------------------"
	echo
	echo "1. ~/.shellnotes/logs/disfailed.txt"
	echo "2. ~/.shellnotes/logs/enfailed.txt"
	echo "3. ~/.shellnotes/logs/ifailed.txt"
	echo "4. ~/.shellnotes/logs/ufailed.txt"
	echo "5. ~/.shellnotes/logs/uninfailed.txt"
	echo "For more info about which one to choose, read /docs/system/loggingsystem.txt"
	echo
	echo -n "[1,2,3,4,5]: " && read input
	if [ $input = 1 ]; then
		less ~/.shellnotes/logs/disfailed.txt
	elif [ $input = 2 ]; then
		less ~/.shellnotes/logs/enfailed.txt
	elif [ $input = 3 ]; then
		less ~/.shellnotes/logs/ifailed.txt
	elif [ $input = 4 ]; then
		less ~/.shellnotes/logs/ufailed.txt
	elif [ $input = 5 ]; then
		less ~/.shellnotes/logs/uninfailed.txt
	else
		echo "Invalid input."
	fi
esac