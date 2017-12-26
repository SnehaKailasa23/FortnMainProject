#!/bin/bash

sudo yum clean all
sudo yum repolist all
sudo yum install $1
# $1 refers to the package_name that needs to be installed
