#!/bin/bash
cd  /var/lib/jenkins/workspace/$JOB_NAME/tata-project
git status
git tag -a tagName -m "Your tag comment"
git merge jenkins-demo
git commit -am "Merged jenkins-demo branch to master'
git push origin master
#####
