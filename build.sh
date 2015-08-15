#!/bin/bash -e

main () {
  mvn clean install
  java -jar target/dependency/webapp-runner.jar target/*.war
}

main