#!/usr/bin/python3
# %%
import os
import shutil
from time import sleep
import logging
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
# %%
source_dir = os.environ.get('source_dir')
# %%
dest_dir_images = os.environ.get('image_location')
dest_dir_onedrive_documents = os.environ.get('one_drive_result')
dest_dir_videos = os.environ.get('video_directory')
dest_dir_documents = os.environ.get('customer_result')
# %%

video_extensions = [
    ".webm", ".mpg", ".mp2", ".mpeg", ".mpe", ".mpv", ".ogg",
    ".mp4", ".mp4v", ".m4v", ".avi", ".wmv", ".mov", ".qt",
    ".flv", ".swf", ".avchd"
]

document_extensions = [
    ".doc", ".docx", ".odt", ".pdf", ".xls", ".xlsx", ".ppt", ".pptx", ".txt"
]

berkeley_extensions = [
    "UC", "Berkeley", "status", "report", "kickoff", "meeting", "meetings"
]

image_extensions = [
    ".jpg", ".jpeg", ".jpe", ".jif", ".jfif", ".jfi", ".png", ".gif", ".webp", ".tiff",
    ".tif", ".psd", ".raw", ".arw", ".cr2", ".nrw", ".k25", ".bmp", ".dib", ".heif", ".heic",
    ".ind", ".indd", ".indt", ".jp2", ".j2k", ".jpf", ".jpf", ".jpx", ".jpm", ".mj2", ".svg",
    ".svgz", ".ai", ".eps", ".ico"
]
# %%


class MoverHandler(FileSystemEventHandler):

    """
        this is the class that inherits the 'on_modified' method from the FileSystemEventHandler
        and is where we define the class methods that will be used whenever
        there is a change to the Filesystem
    """

    def on_modified(self, event):
        with os.scandir(source_dir) as entries:
            for entry in entries:
                self.check_video_files(entry)
                self.check_image_files(entry)
                self.check_document_files(entry)
                self.check_customer_files(entry)

    def make_unique(self, path):
        """
        this method helps to create a new file name if there is another in the same place.
        """
        filename, extension = os.path.splitext(path)  # returns a tuple with the filename, then the extension
        counter = 1
    # * IF FILE EXISTS, ADDS NUMBER TO THE END OF THE FILENAME
        while os.path.exists(path):
            path = f"{filename} ({counter}){extension}"
            counter += 1
        return path

    def check_customer_files(self, entry):
        """
            loops through the defined extension list, and if any items in the list are
            found in the os.DirEntry object, then it moves the entry to the pre-defined destination
            folder
        """
        for keyword in berkeley_extensions:
            if os.path.exists(entry):
                if entry.name.__contains__(keyword.lower()) or entry.name.__contains__(keyword.upper()):
                    # new_path = self.make_unique(entry)
                    # os.rename(entry.path, new_path)
                    shutil.move(entry.path, dest_dir_onedrive_documents)
                    logging.info(f"Moved Customer File: {entry.name}")

    def check_document_files(self, entry):
        for extension in document_extensions:
            if os.path.exists(entry):
                if entry.name.endswith(extension) or entry.name.endswith(extension.upper()):
                    # new_path = self.make_unique(entry)
                    # os.rename(entry.path, new_path)
                    print(entry.path)
                    shutil.move(entry.path, dest_dir_documents)
                    logging.info(f"Moved Document file: {entry.name}")

    def check_image_files(self, entry):
        for extension in image_extensions:
            if os.path.exists(entry):
                if entry.name.endswith(extension) or entry.name.endswith(extension.upper()):
                    # new_path = self.make_unique(entry)
                    # os.rename(entry.path, new_path)
                    shutil.move(entry.path, dest_dir_images)
                    logging.info(f"Moved Image file: {entry.name}")

    def check_video_files(self, entry):
        for extension in video_extensions:
            if os.path.exists(entry):
                if entry.name.endswith(extension) or entry.name.endswith(extension.upper()):

                    # new_path = self.make_unique(entry)
                    # os.rename(entry.path, new_path)

                    shutil.move(entry.path, dest_dir_videos)
                    logging.info(f"Moved Video file: {entry.name}")

# %%


if __name__ == "__main__":

    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s - %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S')  # initialize the logging instance
    PATH = source_dir  # rename source_dir to observer instance syntax
    event_handler = MoverHandler()  # create an instance of our 'MoverHandler' class
    observer = Observer()  # create an observer object
    observer.schedule(event_handler, PATH, recursive=True)
    # assign an observer to watch a certain "PATH" and use relavent methods from your "event_handler"
    observer.start()  # start your instance
    try:
        while True:
            sleep(10)
    except KeyboardInterrupt:
        observer.stop()
        observer.join()
