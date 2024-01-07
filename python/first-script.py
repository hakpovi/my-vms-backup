#/usr/bin/env python





def backup(source, destination):
    # Get the current date and time
    now = datetime.datetime.now()
    timestamp = now.strftime("%Y%m%d-%H%M%S")

    # Append the timestamp to the backup directory
    backup_destination = f"{destination}/{timestamp}"

    try:
        # Run rsync command
        subprocess.run(["rsync", "-av", source, backup_destination], check=True)
        print(f"Backup completed successfully. Files are backed up in {backup_destination}")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}")

# Replace with your own source and destination paths
source_directory = "/path/to/source/directory"
backup_directory = "/path/to/backup/directory"

backup(source_directory, backup_directory)
