#!/bin/bash

# Change to the specified directory
cd /opt/bitnami/SITES

# Gather folders ending with 'edu'
folders=$(ls -1 | grep edu$)

# Loop through each folder
for folder in $folders
do
  echo "Processing $folder"
  cd $folder

  # Execute the commands
  sudo chown -R bitnami:daemon .
  sudo find `pwd` -type d -exec chmod 775 {} \;
  sudo find `pwd` -type f -exec chmod 664 {} \;
  if [ -f ./wp-config.php ]; then
    sudo chmod 640 ./wp-config.php
  fi

  # Go back to the parent directory
  cd ..
done

echo "Done processing folders.":
