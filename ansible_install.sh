#!/bin/sh

ansible_file=$(find / -name ansible*tar.gz)

tar -xzf ${ansible_file} -C /tmp/

rpm -ivh /tmp/ansible/*.rpm --force

if [ $? -eq 0 ];then
  echo "ansible install success!"
else
  echo "ansible install faild!"
fi
