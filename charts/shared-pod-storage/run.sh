#!/usr/bin/env sh

timeout=3

if [ ! -f /tmp/lock ]; then
  echo "locking"
  touch /tmp/lock
  if [ ! -f /tmp/counter ]; then
    echo "1" > /tmp/counter
  fi
  while true; do
    counter=$(cat /tmp/counter)
    echo "read counter: $counter"
    ((counter=counter+1))
    echo "incrementing counter: $counter"
    echo $counter > /tmp/counter
    echo "wrote counter: $(cat /tmp/counter)"
    sleep $timeout
  done
else
  while true; do
    echo "found counter: $(cat /tmp/counter)"
    sleep $timeout
  done
fi    