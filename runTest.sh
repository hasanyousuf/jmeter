#!/bin/bash
rm -rf project/repo/*
sh apache-jmeter-4.0/bin/jmeter -JUser=${USERS_TREADS} -JRampUp=1 -JLoop=10 -n -t project/cake.jmx -l project/repo/HTML/cake.csv -e -o project/repo/Reports/
#open ./project/repo/Reports/
