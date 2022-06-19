#!/bin/bash

# BASH function that kill and remove the running containers
function stop()
{

P1=$(docker ps -q)
if [ "${P1}" != "" ]; then
  ech