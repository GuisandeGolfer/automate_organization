#!/usr/bin/env bash

if [[ $OSTYPE == 'darwin'* ]]; then
    echo 'macOS'
else
    echo 'not-MacOS'
fi

_DEBUG="on"

function DEBUG() 
{
        [ "$_DEBUG" == "on" ] && $@
}


# tip: make sure there is a space next to the colon for doing multi-line comments

#    Everything is operational above this multi-line comments
#    all I need to do next is 
#        4. [] add error-handling for when bash runs the commands "python3 main.py" 
#        5. [] when the user types a folder name, add in the rest of the full path information to the variable passed to the python script
#        6. [x] when a user says 'no' make the program start running again from line 46 
#
user=$(whoami)
current_directory=$(pwd)

source dialogue_func.sh


echo "Welcome to the Python Watchdog Folder Automation Tool"

sleep 2

configure_file_locations 


echo -e " Is this information correct? ('yes' or 'no'): \n $source_dir \n $image_location \n $video_directory \n $customer_result \n $one_drive_result"

read response

if [[ "$response" == "yes" ]]; then
        echo "nice starting the python script with your folder choices, below this line of text ... Good Luck!"
        sleep 1
else
        configure_file_locations
fi

# export all confirmed variables

export source_dir
export image_location
export video_directory
export customer_result
export one_drive_result

# since the command below is a child-process, 'main.py' will have access to the environment variables defined and exported in this script.

DEBUG python3 main.py
