#!/usr/bin/env/ bash

function configure_file_locations {
    echo "Let's start by configuring a couple of file locations ..."

    sleep 2

    echo "What path do you want this script to monitor changes? ('Desktop', 'Downloads', or full-path-name like '/Users/-user-/Desktop/this_folder'"

    read source_dir

    if [[ $source_dir -eq "Desktop" ]]; then
        echo "Desktop is a nice location to de-clutter"
        source_dir="/Users/$user/Desktop"

    elif [[ $source_dir -eq "Downloads" ]]; then
        echo "Downloads folder works! keep it nice and organized"
        source_dir="/Users/$user/Downloads"
    else
        echo "Cool! went with your own custom path location"
    fi
    echo "Where do you want to put images? i.e. '<full-path-name>/images' or '.../images' will auto-popoulate the rest of the path with the current working directory"

    read image_location


    full_image_name=""

    echo "...videos?"

    read video_directory

    echo "...customer documents?"

    read customer_result

    echo "do you want to designate a location for one_drive?"

    if [[ $one_drive_result == "yes" ]]; then
        read one_drive_result

    fi
}


