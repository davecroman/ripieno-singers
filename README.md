# The Ripieno Singers Official Weboste

## Setting Up

1. Install **jdk7** if you don't have it yet. You can follow the installation guide from here: https://docs.oracle.com/javase/7/docs/webnotes/install/index.html
2. Install **Maven 3.1.1** Get it from here: https://maven.apache.org/download.cgi
3. Install **Git**
4. Run this command in the terminal

    `git clone https://github.com/davecroman/ripieno-singers.git`


## Running the application locally

Go to the root of the project

    cd ripieno-singers
        
### Option 1

First build with:

    mvn clean install

Then run it with:

    java -jar target/dependency/webapp-runner.jar target/*.war

To run the app, open your browser and enter the following:

    localhost:8080
    
### Option 2

Alternatively, you can run the app from the root of the project using this command:

    ./build.sh
    
Once the build has finished, open your browser and go to `localhost:8080`

## Acknowledgement

UI Design and Mockups by **Danielle Marie Manuel** and **Jayson Labatorio**