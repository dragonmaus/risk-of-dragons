#!/bin/sh

home=$(dirname "$0")
home=$(cd "$home" && env -i pwd)
name=$(jq -r .name < "$home/pack/manifest.json")
vers=$(jq -r .version_number < "$home/pack/manifest.json")
file=$name-$vers.zip

if test -f "$home/$file"
then
	echo "$file already exists"
else
	cd "$home/pack"
	zip -r9oD "$home/$file" .
	echo "$file created"
fi
