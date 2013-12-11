Drupal module stub files.

Each file contains the basic information required to start a new module.
Once pulled run: 

./rename.sh your_modules_name

This will update the files, replacing:
- blank_module -> your_modules_name
- Blank_Module -> Your modules name

Further changes will need to be made manually.

============================================================
Creating a new file.

within the file (as well as the filename) use blank_module for the machine readable name
and Blank_Module for the human readable name. For example:

function blank_module_hook(){
  print('This is the Blank_Module module');
}

This will be converted to 

function safety_scan_hook(){
  print('This is the Safety scan module.');
}
