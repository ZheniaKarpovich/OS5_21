#!/bin/bash
echo "Welcome in Bulls and Cows game. Numbes was made. Game has started"
endFlag=0
RANGE=10
lenght=4
steps=0
first=$RANDOM
let "first %= $RANGE"
second=$RANDOM
let "second %= $RANGE"
while [ "$second" -eq "$first" ]
do
	second=$RANDOM
	let "second %= $RANGE"	
done
third=$RANDOM
let "third %= $RANGE"
while [[ "$third" -eq "$first" || "$third" -eq "$second" ]]
do
	third=$RANDOM
	let "third %= $RANGE"	
done
fourth=$RANDOM
let "fourth %= $RANGE"
while [[ "$fourth" -eq "$first" || "$fourth" -eq "$second" || "$fourth" -eq "$third" ]]
do
	fourth=$RANDOM
	let "fourth %= $RANGE"	
done
while [ $endFlag -eq 0 ]
do
	echo "Input your number or 'end' to end game:"
	read try
	cows=0
	bulls=0
	for((i=0; i<lenght; i++))
	do
		tmp=${try:i:1}
		case "$tmp" in
		"$first")
			if [ "$i" -eq 0 ]
			then
				let "bulls += 1" 
			else
				let "cows += 1"
			fi
		;;
		"$second")
			if [ "$i" -eq 1 ]
			then
				let "bulls += 1" 
			else
				let "cows += 1"
			fi
		;;
		"$third")
			if [ "$i" -eq 2 ]
			then
				let "bulls += 1" 
			else
				let "cows += 1"
			fi
		;;
		"$fourth")
			if [ "$i" -eq 3 ]
			then
				let "bulls += 1" 
			else
				let "cows += 1"
			fi
		;;
		esac
	done
	echo "FLAG"
	if [ "$try" == "end" ]
	then
		echo "Game over. You lose"
		endFlag=1				
	elif [ "$bulls" -eq "$lenght" ]
	then
		echo "Result: C${cows}B${bulls}"
		echo "Game over. You win. Your number of steps: $steps"
		endFlag=1
	else
		echo "Result: C${cows}B${bulls}"
		let "steps++"
	fi
done
exit;
