# Prerequists to execute the project
* Jenkins machine should able to reach the deployed Demo API for testing
* User should have rights to create, execute jobs
* Jenkins plugins need to be installed (Git client, HTML Publisher plugin, Performance Plugin)
#### Create new job in jenkins using the following steps
* Login to jenkins
* Click "New Item"
* Enter the job name "DemoJmeter"
* Select project type "Freestyle project"
* Click "Ok"
* Check "This project is parameterized"
* Click "Add Parameter", select "String parameter", enter in Name as "HTTP_PROTOCOL", default value as "http" & Description "It can be http or https"
* Click "Add Parameter", select "String parameter", enter in Name as "SERVER_ADDRESS", default value as "192.168.1.3" & Description "Change it according to your setup"
* Click "Add Parameter", select "String parameter", enter in Name as "SERVER_PORT", default value as "9000" & Description "Server port"
* Click "Add Parameter", select "Choice parameter", enter in Name as "USERS_TREADS", in Choices add "25 10 5 1" in each row & Description "Number of users"
* Click "Add Parameter", select "Choice parameter", enter in Name as "RAMPUP_TIME", in Choices add "1 2 3 4 5 6" in each row & Description "RampUp time in seconds"
* Click "Add Parameter", select "Choice parameter", enter in Name as "LOOP", in Choices add "10 5 1" in each row & Description "Number of loops"
* Click "Add Parameter", select "String parameter", enter in Name as "RESPONSE_TIME", default value as "1000" & Description "Time in milliseconds"
* In "Source Code Management" section, select "Git" & add url https://github.com/hasanyousuf/jmeter.git
* In Build section, select "Execute shell", Add the following code
```sh
#!/bin/bash
echo $USERS_TREADS $RAMPUP_TIME $LOOP $SERVER_ADDRESS $SERVER_PORT $HTTP_PROTOCOL $RESPONSE_TIME

./runTest.sh $USERS_TREADS $RAMPUP_TIME $LOOP $SERVER_ADDRESS $SERVER_PORT $HTTP_PROTOCOL $RESPONSE_TIME
```
* In "Post-build Actions" section, Click on "Add post-build action" & choose "Publish HTML report" 
* In HTML directory to archive field, enter project/repo/Reports/
* In Index Page[s] enter index.html
* In "Post-build Actions" section, Click on "Add post-build action" & choose "Publish Performance test result report" 
* In "Source data files (autodetects format):" field enter ./project/repo/HTML/cake.csv
* Press "Apply" button
* Press "Save" button

![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/1.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/2.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/3.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/4.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/5.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/6.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/7.png)
![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/8.png)

# Project feature
  - It is jmeter project
  - Can be integrated with Jenkins
  _ Can be integrated in build pipe line in Jenkins
  _ Reading data dynamically from cvs files
  - User can set virtaul users, Rampup time, Loop, server, server port address using Jenkins
  - As Jmeter has support for 1000 current user, so this project also support to have 1000 users concurrently ideally
  - Project also support to send command to distributed slave machines (It is not enabled yet)
  _ It generate HTML reports dashboard
  _ Performance reports are visible in jenkins job
  
# Project limitations
  _ Project can be maven project and all dependencies should be handeld by maven
  _ Currently project is not moduler
  _ CVS file have 250 users only
  _ Tests will be executed on all endpoints with same number of users
  _ HTML report should be downloaed to view actual report 
  _ Jmeter logs can not changed to debug/errors

# Project  struture
  _  Root folder of project
  	- runTest.sh (project executiong file)
  	_ jmeeter.log (jmeter logs)
  	_ apache-jmeter-4.0 (Jmeter tools with all dependencies related to current project)
  	_ project (project code)
  		_ data/user.csv (user data being used in testing)
  		_ cake.jms (Test plan)
  		- images (images to setup using jenkins/Report)
  		_ repo/HTML/cake.csv (Test results which are being used in reports)
  		- repo/HTML/aggregateReport.csv (Aggregate report) (Currently not being to have separate graphs)
  		- repo/Reports/ (directory where project HTML report is generated)

# Following commands should be executed to build the project
  - Make sure API up and running
  - Select the job "DemoJmeter"
  - Click on "Build with Parameters"
  - Verify that all fields have correct parameters
  - Press "Build" button
  - Excecute the job two three times with same or different parameters to be able to generate graphs. 
  # Note: 
If server is not reset, reports will have lot of failsure of creation of users.

# Reports
 - Click on "DemoJmeter" & "Response Time" and "Percentage of Error" graphs will be shown
 - To get Compelete Test report
 - Click on "Workspace" and navigate to project /repo/Report/
 - Click "all files in zip"
 - Download the the zip file & unzip and open index.html
 ![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/10.png)
 ![alt text](https://github.com/hasanyousuf/jmeter/blob/master/project/images/9.png)



