#!/bin/bash

pname= $1
tdir= /templates
pdir= 

if [ -z "$pname" ]; then
   usage
   exit 1
elif 
