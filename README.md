# Folder Organization Automation

## Initial Configuration

## Overview

1. Add source directory path
2. Add other directory paths for
   - images
   - documents
   - videos
   - for OneDrive
   - for SharePoint
   - etc.
3. Mac OSX Automation Install
4. Windows Automation Install
5. Method Overview + Customization Instructions

---

### Add Source Directory Path

> the variable listed as `source_dir` is where you will put the full path

<img width="850" alt="Screen Shot 2022-06-06 at 3 37 58 PM" src="https://user-images.githubusercontent.com/36752256/173213881-75bdb4be-3d7a-4329-a5dd-80edab54ccb7.png">

This screenshot shows that I wanwt this script to manage my Downloads folder.

### Add Other Directory Paths

> the other variables listed after `source_dir` are where you will put the
> absolute paths of the locations you want to put your files once they are organized.

<img width="900" alt="Screen Shot 2022-06-11 at 8 59 34 PM" src="https://user-images.githubusercontent.com/36752256/173213886-457ab9c5-dc79-4678-a646-15bd07f17716.png">


### Script Overview

1. First, we import all the necessary modules
   - `os, shutil`
   - `time`
   - `logging`
   - `watchdog`
2. Next, we enter in our folder locations that we want to have our files moved to.
   - `dest_dir_onedrive_documents`
   - `dest_dir_images`
   - `dest_dir_videos`
   - `dest_dir_documents`
3. Then, we create our "MoverHandler" python class that will hold the methods for checking any new files added to `source_dir`
4. Lastly, we instaniate our `observer` object from the `watchdog` module
   - the object needs a `PATH` to watch for changes, an `event_handler` to use to handle those changes in path
   - and whether you want it to recursively check the `path` that is given.

---

### FAQ

Q: What about if I am using a Windows machine? > then the script will automatically detect your OS and change your folder format to match a Windows operating system :)

Q: What about if I am using a Windows machine? > then the script will automatically detect your OS and change your folder format to match a Windows operating system :):

Q: What about if I am using a Windows machine? > then the script will automatically detect your OS and change your folder format to match a Windows operating system :):

Q: What about if I am using a Windows machine? > then the script will automatically detect your OS and change your folder format to match a Windows operating system :):
