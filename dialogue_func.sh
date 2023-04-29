#!/usr/bin/env/ bash


function configure_file_locations {
    echo "Let's start by configuring a couple of file locations ..."

    sleep 2

    echo "What path do you want this script to monitor changes? ('Desktop', 'Downloads', or full-path-name like '/Users/ %(-insert-username-here-)s /Desktop/this_folder'"

    read source_dir

    # add OS type check later to this if statement
    if [[ $source_dir -eq "Desktop" ]]; then
        echo "Desktop is a nice location to de-clutter"
        source_dir="/Users/$user/Desktop"

    elif [[ $source_dir -eq "Downloads" ]]; then
        echo "Downloads folder works! keep it nice and organized"
        source_dir="/Users/$user/Downloads"
    else
        # add regex to make sure their response fits the criteria for a correct absolute path.
        echo "Cool! went with your own custom path location"
    fi

    echo "Where do you want to put images? i.e. '<full-path-name>/images' or '.../images' will auto-popoulate the rest of the path with the current working directory"

    read image_location

    if [[ $image_location -eq "images" ]]; then
        echo "Images going into /images...that makes sense..nice."
        image_location="/Users/$user/Desktop/Images" # can changes this later once the code actually works. 
    fi

    echo "...videos?"

    read video_directory

    if [[ $video_directory -eq "videos" ]]; then
        echo "videos going into /videos...that makes sense..nice."
        video_directory="/Users/$user/Desktop/Videos" # can changes this later once the code actually works. 

    fi

    echo "...customer documents?"

    read customer_result

    if [[ $customer_result -eq "customer_docs" ]]; then
        echo "customers are in safe hands...that's awesome...nice."
        customer_result="/Users/$user/Desktop/customer_docs" # can changes this later once the code actually works. 
    fi
}

