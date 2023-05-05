#!/bin/sh

dir_name=$(dirname $0)

ansible_file=$(find `dir_name` -name ansible*tar.gz)

tar -xzf ${ansible_file} -C /tmp/

rpm -ivh /tmp/ansible/*.rpm --force

if [ $? -eq 0 ];then
  echo "ansible install success!"
else
  echo "ansible install faild!"
fi
