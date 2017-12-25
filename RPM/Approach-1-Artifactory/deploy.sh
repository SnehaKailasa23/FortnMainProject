#!/bin/bash

sudo yum clean all
sudo yum repolist all
sudo yum install $1
