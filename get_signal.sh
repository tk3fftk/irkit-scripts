#!/bin/bash

IRKIT_IP=192.168.3.103
result='first'

echo 'refresh stored signal'
while [ "$result" != '' ]
do
  result=`curl $IRKIT_IP/messages -s -H 'X-Requested-With: curl'`
  echo $result
done

result=''

while [ "$result" = '' ]
do
  echo 'waiting signal...'
  result=`curl $IRKIT_IP/messages -s -H 'X-Requested-With: curl'`
  sleep 3
done

echo $result
