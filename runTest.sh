#!/bin/bash
echo "User is: " $1
echo "Rampup is: " $2
echo "loop is: " $3
echo "server is: " $4
echo "port is: " $5
echo "http is: " $6


rm -rf project/repo/*
sh  apache-jmeter-4.0/bin/jmeter -JUser="$1" -JRampUp="$2" -JLoop="$3" -JServer="$4" -JPort="$5" -JHttp="$6" -n -t project/cake.jmx -l project/repo/HTML/cake.csv -e -o project/repo/Reports/
#open ./project/repo/Reports/
