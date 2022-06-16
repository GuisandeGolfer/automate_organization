#!/usr/bin/env bash

user=$(whoami)
current_directory=$(pwd)

echo "Welcome to the Python Watchdog Folder Automation Tool"

sleep 2

function configure_file_locations {
    echo "Let's start by configuring a couple of file locations ..."

    sleep 2 

    echo "What path do you want this script to monitor changes? ('Desktop', 'Downloads', or full-path-name like '/Users/-user-/Desktop/this_folder'"

    read source_dir

    if [[ $source_dir -eq "Desktop" ]]; then  
        echo "Desktop is a nice location to de-clutter"
        source_dir="/Users/$user/Desktop"
        export source_dir

    elif [[ $source_dir -eq "Downloads" ]]; then
        echo "Downloads folder works! keep it nice and organized"
        source_dir="/Users/$user/Downloads"
        export source_dir
    else
        echo "Cool! went with your own custom path location"
        export source_dir
    fi
    echo "Where do you want to put images? i.e. '<full-path-name>/images' or '.../images' will auto-popoulate the rest of the path with the current working directory"

    read image_location

    echo "...videos?"

    read video_directory

    echo "...customer documents?"

    read customer_result

    echo "do you want to designate a location for one_drive?"

    if [[ $one_drive_result == "yes" ]]; then
        
        read one_drive_result

    fi 
} 

configure_file_locations 

# tip: make sure there is a space next to the colon for doing multi-line comments

#    Everything is operational above this multi-line comments
#    all I need to do next is 
#        1. [x] fill out the rest of the directory instantiating
#        2. [x] figure out how to add those variables into my python script automatically (exporting variable and then pulling them later into python script)
#        3. [x] and then run "main.py" (just write "python3 main.py" directly in the bash script)
#        4. [] add error-handling for when bash runs the commands "python3 main.py" 
#        5. [] when a user says 'no' make the program start running again from line 46 
#        6. [] when the user types a folder name, add in the rest of the full path information to the variable passed to the python script
#
echo -e " Is this information correct? ('yes' or 'no'): \n $source_dir \n $image_location \n $video_directory \n $customer_result \n $one_drive_result"

read response

if [[ "$response" == "yes" ]]; then
        echo "nice starting the python script with your folder choices, below this line of text ... Good Luck!"
        sleep 2
else
        configure_file_locations
        # find a way to loop this script back to the original folder question at line 46
            # maybe I can write a function in bash? that way I can run the folder logic within this 'else' statement
fi

# export all confirmed variables

export image_location
export video_directory
export customer_result
export one_drive_result

# since the command below is a child-process, 'main.py' will have access to the environment variables defined and exported in this script.

python3 main.py
