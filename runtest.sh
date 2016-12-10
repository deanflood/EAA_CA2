#!/bin/bash

echo "IDLE N CO" >> results.dat						#Adding header for results file

for i in {1..50} 									#Loop for 50 simulated users
do
    ./loadtest $i &									#Runs loadtest with current index as number of users. & symbol runs program in background
    idle=$(mpstat 1 10 | awk 'END{print $NF}')		#Captures the processor load every second for 10 seconds. awk used to capture average of 10 measurements
    pkill loadtest									#Kills loadtest after results are captured
    echo $idle " " $i " " $(wc -l synthetic.dat | awk '{print $1}') >> results.dat	#Echos results of load test and N into file. wc -l used to caputre C0 from generaated synthetic.dat
done
