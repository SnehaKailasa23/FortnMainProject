#!/bin/bash
source env

yum clean all
yum repolist all
yum install $package_name
