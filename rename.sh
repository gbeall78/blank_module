#!/bin/bash

###
# Make sure a name is given
if [[ $# -eq 0 ]]; then
  echo "Please enter the name you wish to change the module too.";
  echo "If the name has multiple words it will be converted too word1_word2.";
  exit;
fi

###
# If name is multiple words set the variables accordingly
machine_name=`echo $1 | tr "[:upper:]" "[:lower:]" | tr "[:blank:]" "_"`;
human_name="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}";
new_dir="../$machine_name";

if [[ ! -d $new_dir ]] ; then
  mkdir $new_dir;
  echo "Created directory $new_dir";
fi

for i in `find ./ -name "blank_module*"`; do
  i=`sed -E "s/\.\/\///" <<< $i`;
  filename=`sed -E "s/blank_module/$machine_name/" <<< $i`;

  echo "Converting $i";
  sed "s/Blank_Module/$human_name/g" $i > $i.tmp ; 
  sed "s/blank_module/$machine_name/g" $i.tmp > $new_dir/$filename; 
  echo "Outputting to $new_dir/$filename"
done 

echo "Removing old directory $(pwd)";
rm -rf $(pwd);

echo "Changing to $new_dir";
cd $new_dir

echo "Done."
exit 0;
