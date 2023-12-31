#!/bin/bash

/usr/bin/sleep 10;

if /usr/bin/ping -c 1 192.168.5.25 > /dev/null 2>&1; then
  /usr/bin/curl -d "Intel Nuc On "  192.168.5.25:8125/home

else
  /usr/bin/sleep 10;
  /usr/bin/curl -d "Intel Nuc On "  192.168.5.25:8125/home
fi
