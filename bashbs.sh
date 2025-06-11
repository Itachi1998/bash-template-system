#!/bin/bash

usage(){
 >&2 echo "Usage: $0 <project>"
 return 0
}
pname=$1
pdir="./${pname}"
tdir=/var/bash.sh/templates


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
cd $tdir
echo "Select a template"
select x in *; do
   template="$x"
   break
done

cd $cur
cp -R ${tdir}/$template $pdir
cd $pdir
for x in *; do
  new=$(sed "s,PROJECTNAME,$pname,g" <<< "$x")
  if [ "$x" = "$new" ]; then
    sed "s, PROJECTNAMEA,$pname,g" < $x > temp
    mv -f temp $x
  else
    sed "s,PROJECTNAME,$pname,g" < $x > $new
    if [ -e "$new" ]; then
      rm -f $x
    fi
  fi
done