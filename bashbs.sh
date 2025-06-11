#!/bin/bash


pname= $1
pdir = "./${pname}"
tdir= /templates
pdir= 

if [ -z "$pname" ]; then
   usage
   exit 1
elif ! [ -d "$tdir" ]; then
   >&2 echo "Unable to find template for: $tdir"
   exit 2
elif [ -d "$pdir" ]; then
   >&2 echo "Project dir already exists: $pdir"
   exit 3
fi

cur="$PWD"
cd $dir
echo "Select a template"
select x in *; do
   template="$x"
   break
done

