#!/usr/bin/env sh

timeout=10

if [ ! -f /var/nfs/lock ]; then
  echo "locking"
  touch /var/nfs/lock
  if [ ! -f /var/nfs/counter ]; then
    echo "1" > /var/nfs/counter
  fi
  while true; do
    counter=$(cat /var/nfs/counter)
    let counter++
    echo "incrementing counter: $counter"
    echo $counter > /var/nfs/counter
    sleep $timeout
  done
else
  while true; do
    echo "found counter: $(cat /var/nfs/counter)"
    sleep $timeout
  done
fi    