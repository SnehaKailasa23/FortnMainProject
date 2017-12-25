#!/bin/bash

yum clean all
yum repolist all
sudo yum install $1
