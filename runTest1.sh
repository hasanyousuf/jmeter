rm -rf project/repo/*
sh apache-jmeter-4.0/bin/jmeter Jjmeter.save.saveservice.output_format=xml -Jjmeter.save.saveservice.output_format=csv -n -t project/server.jmx -l project/repo/HTML/cake.csv -e -o project/repo/Reports/
open ./project/repo/Reports/
