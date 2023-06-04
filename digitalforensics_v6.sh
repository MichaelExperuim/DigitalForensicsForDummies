#!/bin/bash
#      Name: digitalforensics.sh
#      Expected date of completion: 3/29/2023
#
#      Version: 0.0.6
#         Version History - 0.0.1 - initial ideas and completion of basic processes
#         Version History - 0.0.2 - added more functions and processes, along with bug fixes and actually making the code work. Addition of several tools 
#                                   and processes as well. 
#         Version History - 0.0.3 - Added user validation and error handling, along with the correct installation of tools. Added date and time headers 
#                                   and separation of functions with a line. Added if the user is running the script as root.
#         Version History - 0.0.4 - Bug fixes, added more tools, and added more error handling. Remade the ASCII art into a baby. 
#         Version History - 0.0.5 - Added more tools, added more error handling, and added more functions. Added the beginnings of memory dump and analysis w/volatility. 
#         Version History - 0.0.6 - Added the ability to select a storage device and partition to store the investigation on. 
#
#      Developers: Michael, Peyton
#      Honorable Mentions: Ancil 
#      Description: This script will be used to simplify and automate some of the processes of a standard digital forensics for low income and digitally illiterate
#      law enforcement agencies wishing to have basic competencies in digital forensics.
#
##################################
#   TO-DO LIST  #
##################################
# 1. Install all the tools needed for the script to run and run the beautiful ASCII art - DONE
# 2. Check if the user is root. If they are, move on. If they are not, exit the script and inform the user. - DONE
# 3. Launch case_file function and create a new case file directory - DONE
# 4. Launch target_device function and grab the target device - DONE
# 5. Launch image_function and image the target device successfully - DONE
# 6. In image_function, hash the image and store the hashfile in an external text file - IN PROGRES
# 7. Launch memory_dump function and dump the memory of the target device - IN PROGRESS
# 8. Test everything - IN PROGRESS
# 9. Output findings in a pdf file - IN PROGRESS
# 10.Specify two versions: live and nonlive. - IN PROGRESS

# POTENTIAL GOAL: 
###################################################################################################

ascii_art(){
    echo "This script was started on $(date)"
     
    # ASCII art for the script. Is it really a linux tool if it doesn't have ASCII art?
    echo -e " ---
                                                      N0OOOxdOKXW                                   
                                                     NO0W KooOW                                     
                                                     K0W  XOxOW                                     
                                               WWWWWN0K    WW                                       
                                       NKkxdolccccccc;:oxk0XW                                       
                                   WKxlccclodxkO00KKKkdk0OkxxkKW                                    
                                 NOolokXW            W0ON   NKOk0W                                  
                               W0llON                 WXN      NOkX                                 
                              NxlOW                             WKkON                               
                             NxoK                                 XkkX                              
                            WxoK                                   WOxK                             
                            0oO                                     WOdX                            
          WWW               kxN                                      NxkW                           
      WXOOkk0OKW           WkO                                        kxW           NKO0NXXW        
      XxO0xK NOkXN0OX      Wk0                                       WkkW    X000XNOx0KdlkxON       
    WKkkK     WKxxOxkX      0OW                                      NkO    KxOKOkxkN W00W0ox0X     
    WxkWW       NNWXx0      XOX          W0oxN        XddX           Kx0    0kN  WNW     W0k0dO     
     OxN           Xx0       00W         Wk:oX        0;,O          Nxl0    WOxK           WKkX     
     NOxKW         WOOW      XxOW         WWW   K0XW   NXW         NkdxOW    WkdX        WX0OX      
      WKkkKW        NO0W   W0OOON               NXXW  WXN         XdoOKN     NkkN      NK00XW       
        WXOkOXW      NOON  NkOXK0XW                   XddKN     N0k0XW     W0xON     NK0KN          
           N0xkX      W0kKW WXXXKOOKN          NKXXK0OO0XNW   W0k0W      N0kOX     WK0XW            
             W0x0W      N00XW   WKdldk0N       XOO00KNW    WX0kd0     WX0O0N     WKOKW              
               XkkN       NKO0XKkk0XNKOkkOKXWW        WXK0000KNKxKWX0O00KW      NOON                
                WOxKW       NkdkKW     WX0OOOOOOOO00OOOO0KNW    KooO0XW       WKOKW                 
                 WKdON     WKkKW             WWNNNNWWW          W0d0W        XkON                   
                   NxxX   WOkX                                    0xK      W0x0W                    
                    WkoOWW0kX                                     WkxN    XxkN                      
                     WOcdOkX                                       XxO  W0xOW                       
                       k;oK                                         0xXWOxK                         
                       KlxW                                         NxxkkN                          
                       Xx0                                           k:kW                           
                       0kN                                           0o0                            
                       0kN                                           NxO                            
                       0kX                                           NxO                            
                       Xx0                                           XxO                            
             WNXXXXN    klx0KW                  WW                   KoO                            
            N0KN  XKN   XllOOOk0N              WOxxx0             WNKd:O           WXXW             
          WKOKW    X0X   0clXWKOkO0XW          W0ddxX         WX00000ocK         W0kOOk0W           
         WOxN      W0OW   0;;kN WX0OOOOO0KXXNWWWWNNNNXXXKK000OOO0XW X:cX        WOkN  XxkN          
         XdO        NkkXWWW0c.;xN   WNK0OkkO0000000OO00000KXXNW    Kc.oW        0kX    NkxN         
         WOdKW       N0O0000OdcloxXW                             Nk;.'xNW      XkK      Kd0         
          WKkOX                 NxcxX                           KooxkkO000OOOO0OKW      0dK         
            W0k0N                Wk;:0W                        0lxN      WWNNNNW       NkOW         
              NOx0W               Wd.;K                       O:dW                    Nk0W          
                XkxO0KKKXXXXXKKKKKKk;.oXW               WWNK0d''O                   WKkKW           
                 WNK0000OO00OOOOO00OOOkxOOOOOOO00OO0000000OxdlclxO000KXNWW        WXOOX             
                                        WWWNNXXXNNNNWWWWWW     WNKKK00000000O0KKK00OXW              
                                                                          WNK0OOO0XW                

"                                                                                                                                                                                                                                                                                                                                                                            
}

# Install all the tools needed for the script to run
tool_installation(){
    # Display the time and date the script was run
    echo -e "Step #1: tool_installation was run on $(date)\n"

    # Check if the user is root. If they are, move on. If they are not, exit the script and inform the user.
    if [ "$EUID" -ne 0 ]; then
        echo "This script requires elevated privileges due to the invasive nature of the tools used. Please run this script as root. Type 'sudo su' in the command line to become root and rerun the script."
        exit
    fi

    echo "This function will install all the tools needed for the script to run."

    echo -e "Installing all the tools needed for the script to run...\n"
     
    echo -e "Checking if you have the necessary packaging tools installed...\n"
     
    # Check to see if the user has pip installed. If they doo move on. If they do not, install it.
    echo "Checking to see if you have pip installed..."
    if [ -f "/usr/bin/pip" ]; then
        echo "Pip is already installed."
    else
        sudo apt install python3-pip -y
        echo "Pip has been installed."
    fi
    echo " "

    echo "Checking to see if you have git installed..."
    # Check to see if the user has git installed. If they do, move on. If they do not, install it.
    if [ -f "/usr/bin/git" ]; then
        echo "Git is already installed."
    else
        sudo apt install git -y
        echo "Git has been installed."
    fi
    echo " "
    echo "Package management tools have been installed."
    echo -e "\n"

    echo -e "Checking to see if you have the required coding languages and its dependencies installed...\n"
    echo "Checking to see if you have python3 installed..."
    # Check to see if the user has python3 installed. If they do, move on. If they do not, install it.
    if [ -f "/usr/bin/python3" ]; then
        echo "Python3 is already installed."
    else
        sudo apt install python3 -y
        echo "Python3 has been installed."
    fi
    echo " "

    echo "Some tools require python3-dev to be installed. Checking to see if you have it installed..."
    # Check to see if the user has python3-dev installed. If they do, move on. If they do not, install it.
    if [ -f "/usr/bin/python3-dev" ]; then
        echo "Python3-dev is already installed."
    else
        sudo apt install python3-dev -y
        echo "Python3-dev has been installed."
    fi
    echo " "

    echo "Checking to see if you have python2.7 installed. Some tools may require python2.7 to be installed in case python3 does not work..."
    # Check to see if the user has python2.7 installed. If they do, move on. If they do not, install it.
    if [ -f "/usr/bin/python2.7" ]; then
        echo "Python2.7 is already installed."
    else
        sudo apt install python2.7 -y
        echo "Python2.7 has been installed."
    fi
    echo " "

    echo "Checking to see if you have python2.7-dev installed. Some tools may require python2.7-dev to be installed in case python3-dev does not work..."
    # Check to see if the user has python2.7-dev installed. If they do, move on. If they do not, install it.
    if [ -f "/usr/bin/python2.7-dev" ]; then
        echo "Python2.7-dev is already installed."
    else
        sudo apt install python2.7-dev -y
        echo "Python2.7-dev has been installed."
    fi
    echo " "

    # Check to see if the user has java installed. If they do, move on. If they do not, install it.
    echo "Checking to see if you have java installed..."
    if [ -f "/usr/bin/java" ]; then
        echo "Java is already installed."
    else
        sudo apt install default-jdk -y
        echo "Java has been installed."
    fi
    echo " "
    echo -e "Coding languages and its dependencies have been installed.\n"
     
    echo -e "Beginning tool installation...\n"
    echo "Installing Memory Forensics Tools..."
    echo "Installing Volatility..."
    # Check to see if the user has volatility installed. If they do, amove on. If they do not, install it.
    echo "Checking for existing installation of Volatility..."
    VOLATILITY_PATH="$(which vol.py)"
    if [[ -n $VOLATILITY_PATH ]]; then
        echo "Volatility is already installed at: $VOLATILITY_PATH"
    else
        # Install dependencies
        echo "Installing dependencies..."
        sudo apt-get update
        sudo apt-get install python3 python3-distorm3 yara git -y

        # Clone Volatility from Git
        echo "Cloning Volatility from Git..."
        git clone https://github.com/volatilityfoundation/volatility3.git

        # Move Volatility to /opt
        echo "Moving Volatility to /opt..."
        sudo mv volatility3 /opt/

        # Create a symlink to the Volatility executable
        echo "Creating symlink to Volatility executable..."
        sudo ln -s /opt/volatility3/vol.py /usr/local/bin/vol.py

        # Set permissions on the Volatility directory
        echo "Setting permissions on Volatility directory..."
        sudo chown -R root:root /opt/volatility3
        sudo chmod -R 755 /opt/volatility3
        echo "Volatility has been installed."
    fi
    echo " "
    echo -e "Memory Forensics Tools have been installed.\n"

    echo -e "Installing image analysis/carving tools...\n"

    echo "Installing Autopsy..."

    # Check to see if the user has autopsy installed. If they do, move on. If they do not, install it.
    echo "Checking for existing installation of Autopsy..."
    AUTOPSY_PATH="$(which autopsy)"
    if [[ -n $AUTOPSY_PATH ]]; then
        echo "Autopsy is already installed at: $AUTOPSY_PATH"
    else
        echo "Downloading Autopsy..."
        wget https://github.com/sleuthkit/autopsy/releases/download/autopsy-4.19.0/autopsy-4.19.0.zip
        echo "Unzipping Autopsy..."
        unzip autopsy-4.19.0.zip    

        # Move Autopsy to /opt
        echo "Moving Autopsy to /opt..."
        sudo mv autopsy-4.19.0 /opt/

        # Create a symlink to the Autopsy executable
        echo "Creating symlink to Autopsy executable..."
        sudo ln -s /opt/autopsy-4.19.0/bin/autopsy /usr/local/bin/autopsy

        # Set permissions on the Autopsy directory
        echo "Setting permissions on Autopsy directory..."
        sudo chown -R root:root /opt/autopsy-4.19.0
        sudo chmod -R 755 /opt/autopsy-4.19.0
        echo "Autopsy has been installed."
    fi
    echo " "

    # Sleuthkit
    echo "Checking to see if you have Sleuthkit installed..."
    if [ -f "/usr/bin/tsk_loaddb" ]; then
        echo "Sleuthkit is already installed."
    else
        sudo apt-get install sleuthkit -y
        echo "Sleuthkit has been installed."
    fi
    echo " "

    # Foremost
    echo "Checking to see if you have Foremost installed..."
    if [ -f "/usr/bin/foremost" ]; then
        echo "Foremost is already installed."
    else
        sudo apt-get install foremost -y
        echo "Foremost has been installed."
    fi
    echo " "

    # Bulk Extractor
    echo "Checking to see if you have Bulk Extractor installed..."
    if [ -f "/usr/bin/bulk_extractor" ]; then
        echo "Bulk Extractor is already installed."
    else
        sudo apt-get install bulk-extractor -y
        echo "Bulk Extractor has been installed."
    fi
    echo " "

    # Hashdeep
    echo "Checking to see if you have Hashdeep installed..."
    if [ -f "/usr/bin/hashdeep" ]; then
        echo "Hashdeep is already installed."
    else
        sudo apt-get install hashdeep -y
        echo "Hashdeep has been installed."
    fi 
    echo " "

    # Browser History
    # Check if browser-history is already installed
    echo "Checking for existing installation of browser-history..."
    BROWSERHISTORY_PATH="$(which browser-history)"
    if [[ -n $BROWSERHISTORY_PATH ]]; then
        echo "browser-history is already installed at: $BROWSERHISTORY_PATH"
    else
        # Install dependencies
        echo "Installing dependencies..."
        sudo apt-get update
        sudo apt-get install python3 python3-pip -y

        # Install browser-history using pip
        echo "Installing browser-history using pip..."
        sudo pip3 install browser-history

        echo "browser-history has been installed."
    fi
    echo " "

    # Steghide
    echo "Checking to see if you have Steghide installed..."
    if [ -f "/usr/bin/steghide" ]; then
        echo "Steghide is already installed."
    else
        sudo apt-get install steghide -y
        echo "Steghide has been installed."
    fi

    echo "All tools have been installed and verified."
    echo "---------------------------------------------------------------------------------------------------------"
    return 
}

# Function to create a new directory for the investigation and store everything in that directory to prevent clutter and overwriting
case_path(){
    investigation_name=""
    echo "Step #2: case-path was run on $(date)"

    # Display all storage devices and ask the user which one they want to store the investigation on and its results
    echo "List of Storage Devices:"
    lsblk --nodeps -o NAME,SIZE,MODEL,TRAN
    echo " "

    echo "Please select the storage device you would like to store the investigation on: "
    read storage_device

    # Validate user input
    while [ ! -b "/dev/$storage_device" ]; do
        echo "Invalid input. Please select a valid storage device: "
        read storage_device
    done

    echo "You have selected $storage_device."

    echo "List of Partitions on your $storage_device:"
    partitions=$(lsblk -n -o NAME,SIZE,FSTYPE,MOUNTPOINT "/dev/$storage_device")
    echo "$partitions"

    # Use the output of lsblk to display whether the partition contains an operating system. If it is exfat, it is most likely a flash drive or external hard drive. If it is ntfs, it is most likely a Windows partition. If it is ext4, it is most likely a Linux partition. If hfplus, it is most likely a Mac partition.
    read -p "Please enter the name of the partition you would like to store the investigation on: " partition

    # Validate user input
    while ! grep -q "$partition" <<< "$partitions"; do
        read -p "Invalid input. Please enter a valid partition: " partition
    done

    # Get the mountpoint of the selected partition
    mountpoint=$(lsblk -no MOUNTPOINT "/dev/$partition")
    echo "The mountpoint of $partition is $mountpoint"

    # Check if the partition is mounted
    if [ "$mountpoint" == "" ]; then
        echo "The partition is not mounted. Mounting the partition..."
        sudo mount "/dev/$partition" "/mnt/$partition"
        mountpoint="/mnt/$partition"
        echo "The partition is now mounted on $mountpoint"
    fi

    # Automatically create a new directory based on the partition's mount point
    echo "This program will create a new directory based on the partition's mount point and store everything in that directory."
    investigation_name=""
    echo "Please enter the name or case number of the investigation: "
    read investigation_name

    # Create a new directory named after the investigation and validate user input for overwriting the directory
    while true; do
        if [ -d "$mountpoint/$investigation_name" ]; then
            echo "The directory $mountpoint/$investigation_name already exists."
            echo "Would you like to overwrite it? (y/n)"
            read overwrite
            if [ "$overwrite" == "y" ]; then
                echo "Overwriting the directory..."
                rm -rf "$mountpoint/$investigation_name"
                mkdir "$mountpoint/$investigation_name"
                break
            elif [ "$overwrite" == "n" ]; then
                echo "Do you wish to continue with the old directory? (y/n)"
                read continue
                if [ "$continue" == "y" ]; then
                    echo "Continuing with the old directory..."
                    investigation_path="$mountpoint/$investigation_name"
                        echo "$investigation_path"
                        export investigation_path
                    break
                elif [ "$continue" == "n" ]; then
                    echo "Please enter a new directory name."
                    read investigation_name
                else
                    echo "Invalid input. Continuing with the old directory..."
                    break
                fi
            else
                echo "Please enter a valid input."
            fi
        else
            echo "Creating a new directory named $investigation_name..."
            echo "A new directory has been created named $investigation_name"
            mkdir "$mountpoint/$investigation_name"
            investigation_path="$mountpoint/$investigation_name"
            break
        fi
    done

    echo "Changing to the new directory..."
    cd "$investigation_path"
    echo -e "You are now in the $investigation_name directory.\n"
    investigation_path="$(pwd)"

    # Store the investigation_name path in a variable and export it to make it a global variable
    export investigation_path
    echo "$investigation_path"
    export investigation_name
    echo "$investigation_name"
    echo "---------------------------------------------------------------------------------------------------------"
    return

}

# Function to select which storage device to image
target_device(){
    echo "Step #3: target_device was run on $(date)"
    storage_device=""
    echo -e "To preserve the integrity of the evidence, this program will create a forensically sound image of the storage device, where our disk analysis tools will run.\n"
    echo -e "This program will identify all storage devices connected to the computer. We need to know which storage device you would like to create a forensically sound image of.\n"

    # We might want to simplify this even further by having the user plug in a device rather than select from a list of devices. This will make it easier for the user and will prevent any errors.

    # List all storage devices connected to the computer
    echo "The following storage device(s), partition(s), and other information are displayed below:"
    echo " "
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINT 
    echo " "

    # Count the number of storage devices connected to the computer
    storage_device_count=$(lsblk -d -o NAME | wc -l)
    echo "There are $storage_device_count storage device(s) connected to the computer."

    echo "This program identifies these storage devices. Under the NAME column, pick the target storage device you would like to image and analyze."
    lsblk -d -o NAME,SIZE,TRAN
    echo " "

    # Ask the user to enter the the target storage device they would like to image
    echo "Please enter the name of the target storage device you would like to image: "
    read storage_device

    # Check if the user input matches a storage device
    while true; do
        if [ -b "/dev/$storage_device" ]; then
            echo "The storage device is valid."
            break
        else
            echo "That is not a valid storage device. Please enter the target storage device you would like to image: "
            read storage_device
        fi
    done

    # Verify what external storage device they would like to image
    echo "You have selected $storage_device as the target storage device. Is this correct? (y/n)"
    read storage_device_verification

    # Check if the user input matches a storage device
    while true; do
        if [ -b "/dev/$storage_device" ]; then
            echo "The storage device is valid."
            break
        else
            lsblk -d -o NAME,SIZE,TRAN
            echo " "
            echo "That is not a valid storage device. Please enter the name of the external storage device you would like to image: "
            read storage_device
        fi
    done

    # Check if the storage device mentioned is mounted anywhere on the file system. If it is, unmount it and continue with the script if its not in use. If it is in use. If it is in use, display an error message and exit the script.
    if [ -n "$(lsblk -o MOUNTPOINT | grep "/dev/$storage_device")" ]; then
        echo "The storage device is mounted somewhere on the file system."
        echo "Checking to see if the storage device is in use..."
        if [ -n "$(lsof | grep "/dev/$storage_device")" ]; then
            echo "The storage device is in use. Please unmount the storage device and try again."
            exit 1
        else
            echo "The storage device is not in use. Unmounting the storage device..."
            sudo umount "/dev/$storage_device"
            echo "The storage device has been unmounted."
        fi
    else
        echo "The storage device is not mounted anywhere on the file system."
    fi

    export storage_device
    echo "---------------------------------------------------------------------------------------------------------"

    return 
}

# Image the target storage device received from the target_device function and store the image in the investigation directory using the dd command
image_function(){
    echo "Step #4: image_function was run on $(date)"

    # Look to see if any file ends in .img in the investigation directory. If it does, ask the user input if they want to make a new image. If the answer is no, export the image file as a global variable and return to main, otherwise, continue with the script. If there is no .img file, continue with the script.
    if [ -n "$(ls | grep ".img")" ]; then
        echo "There is an existing image file in the $investigation_name directory."
        echo "The existing image file is $(ls | grep ".img")"
        echo "Do you wish to overwrite the existing image file? (y/n)"
        read overwrite
        if [ "$overwrite" == "y" ]; then
            echo "Overwriting the existing image file..."
        elif [ "$overwrite" == "n" ]; then
            echo "Do you wish to continue with the old image file? (y/n)"
            read continue
            if [ "$continue" == "y" ]; then
                echo "Continuing with the old image file..."
                image_file="$(ls | grep ".img")"
                export image_file
                echo "Hashing the image file using sha256 ..."
                # Use sha256sum to hash the old image file and store the hash in a text file named after the image file
                # Create a new output file called hash followed by the date and time ending in .txt
                touch hash$(date +%Y%m%d%H%M%S).txt
                output_file="hash$(date +%Y%m%d%H%M%S).txt"
                echo "Hash created on $(date)" > $output_file
                sha256sum $output_file >> $output_file.txt 
                echo "The hash of the image file has been stored in a text file named $output_file. Use this to verify the integrity of the file."
                return
            elif [ "$continue" == "n" ]; then
                echo "Continuing Script..."
            else
                echo "Invalid input. Continuing with the old image file..."
                export image_file="$(ls | grep ".img")"
                return
            fi
        else
            echo "Please enter a valid input."
        fi
    else
        echo "There is no existing image file in the $investigation_name directory. Continuing with the script..."
    fi

    # Create an input file named input_file and store the user input storage device and /dev/ in it
    input_file="/dev/$storage_device"
    output_file="${investigation_name}_$(date +%Y-%m-%d_%H-%M-%S)_${storage_device##*/}.img"

    # Image the storage device
    echo "Imaging the storage device..."
    sudo dd if=$input_file of=$output_file conv=noerror,sync status=progress

    # Check to see if the image file was created successfully. If it was, display a message and the path to the image file. If it was not, display an error message and exit the script.
    if [ -f "$output_file" ]; then
        echo "The storage device has been imaged and stored in the $investigation_name directory."
        echo "The image file is named $output_file"
        echo "The path to the image file is $investigation_path/$output_file"
        image_file="$output_file"
        export image_file
        echo " "
    else
        echo "There was an error creating the image file. Please check the script and try again."
        exit
    fi

    echo "The storage device has been imaged and stored in the $investigation_name directory."
    echo " "

    # If any file ending in .img does not exist at this point, terminate the script and notify the user
    if [ -z "$(ls | grep ".img")" ]; then
        echo "There is no image file in the $investigation_name directory. Please check the script and try again."
        exit
    fi

    # Hash the image file and store the hash in a text file named after the image file 
    # We should consider the trade offs of using md5 vs sha256 for hashing, especially in concern to data integrity and security ****
    echo "Hashing the image file using sha256 ..."
    # Use sha256sum to hash the newly created image file and store the hash in a text file named after the image file
    touch $output_file.txt
    echo "Hash created on $(date)" > $output_file.txt
    sha256sum $output_file >> $output_file.txt 
    echo "The hash of the image file has been stored in a text file named $output_file.txt. Use this to verify the integrity of the file."
    echo "---------------------------------------------------------------------------------------------------------"
    return
}

# Use bulk-extractor to analyze the target storage device and perform a deep analysis of the data
bulk_extractor(){
    echo "-----------------------------------"
    echo "Step #5: bulk_extractor was run on $(date)"
    # Find the first file ending in .img and set it as the image file
    image_file="$(ls | grep ".img")"

    # Set the output directory for bulk_extractor results
    output_dir="bulk_extractor_results"

    # Set the output summary file name
    summary_file="bulk_extractor_summary.txt"

    # Check if the output directory already exists. If it does, use it as input for the summary file. If it doesn't, create the directory and run the bulk_extractor tool.
    if [ -d "$output_dir" ]; then
        echo "The output directory $output_dir already exists."
        echo "Do you wish to overwrite the existing directory? (y/n)"
        read overwrite
        if [ "$overwrite" == "y" ]; then
            echo "Overwriting the existing directory..."
            rm -r "$output_dir"
            mkdir "$output_dir"
            bulk_extractor -R -o "$output_dir" "$image_file"
        elif [ "$overwrite" == "n" ]; then
            echo "Continuing with the existing directory..."
            return
        else
            echo "Please enter a valid input."
        fi
    else
        echo "Creating the output directory..."
        mkdir "$output_dir"
        bulk_extractor -R -o "$output_dir" "$image_file"
    fi

    # Generate summary file
    echo "SUMMARY FILE" >> "$summary_file"
    echo "" >> "$summary_file"

    # A lot of these do not work, the output file is simply too big. Need to find a better way to use bulk extractor
    echo "EMAILS" >> "$summary_file"
    grep -h -E "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$" "$output_dir/email.txt" | sort -u >> "$summary_file"
    echo "" >> "$summary_file"

    echo "CREDIT CARD NUMBERS" >> "$summary_file"
    grep -h -E "[0-9]{4}[-| ]?[0-9]{4}[-| ]?[0-9]{4}[-| ]?[0-9]{4}" "$output_dir/ccn.txt" | sort -u >> "$summary_file"
    echo "" >> "$summary_file"

    echo "SSNs" >> "$summary_file"
    grep -h -E "[0-9]{3}[-| ]?[0-9]{2}[-| ]?[0-9]{4}" "$output_dir/ssn.txt" | sort -u >> "$summary_file"
    echo "" >> "$summary_file"

    echo "PHONE NUMBERS" >> "$summary_file"
    grep -h -E "(\([0-9]{3}\)|[0-9]{3})[-| ]?[0-9]{3}[-| ]?[0-9]{4}" "$output_dir/telephone.txt" | sort -u >> "$summary_file"
    echo "" >> "$summary_file"

    echo "URLS" >> "$summary_file"
    grep -h -E "https?://[a-zA-Z0-9./?=_-]*" "$output_dir/url.txt" | sort -u >> "$summary_file"
    echo "" >> "$summary_file"

    echo "URL SEARCHES" >> "$summary_file"
    grep -h -E "^[a-zA-Z0-9./?=_-]*\?[a-zA-Z0-9./?=_-]*" "$output_dir/url_search.txt" | sort -u >> "$summary_file"

    echo "SOCIAL MEDIA" >> "$summary_file"
    grep -h -E "(facebook|twitter|linkedin|instagram)" "$output_dir/social.txt" >> "$summary_file"

    echo "GPS/LOCATIONS" >> "$summary_file"
    grep -h -E "[0-9]+\.[0-9]+,[0-9]+\.[0-9]+" "$output_dir/filtered_output.txt" >> "$summary_file"
    echo "" >> "$summary_file"

    echo "IMAGES" >> "$summary_file"
    find "$output_dir" -name "*.jpg" -o -name "*.png" -o -name "*.pdf" >> "$summary_file"
    echo "" >> "$summary_file"

    image_output_dir="bulk_extractor_images"
    mkdir "$image_output_dir"
    echo "Copying image files to the output directory..."
    find "$output_dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.pdf" \) -exec cp {} "$image_output_dir" \;

    # GO through the summary file and remove any duplicates
    awk '!seen[$0]++' "$summary_file" > "$summary_file.tmp" && mv "$summary_file.tmp" "$summary_file"
    cat "$summary_file"

    echo "Summary file created. Please check the bulk_extractor_results directory for more information."
    return
}

# Memory Analysis. Does not work because I don;t know how memory analysis works. 

# Create a function that uses volatility to memory dump the computer and store the memory dump in the investigation directory. Ask the user if the computer is on or off.
memory_dump(){
    echo "Step #5: memory_dump was run on $(date)"

    # Check to see if the computer is on or off. If it is on, ask the user if they want to continue. If they do, continue with the script. If they do not, exit the script. If the computer is off, continue with the script.
    if [ -n "$(ps -A | grep "Xorg")" ]; then
        echo "The computer is on. Do you wish to continue? (y/n)"
        read continue
        if [ "$continue" == "y" ]; then
            echo "Continuing with the script..."
        elif [ "$continue" == "n" ]; then
            echo "Exiting the script..."
            exit
        else
            echo "Please enter a valid input."
        fi
    else
        echo "The computer is off. Continuing with the script..."
    fi

    # Check to see if any file ending in .dmp exists in the investigation directory. If it does, ask the user if they want to overwrite the existing memory dump. If they do, continue with the script. If they do not, exit the script. If there is no .dmp file, continue with the script.
    if [ -n "$(ls | grep ".dmp")" ]; then
        echo "There is an existing memory dump in the $investigation_name directory."
        echo "The existing memory dump is $(ls | grep ".dmp")"
        echo "Do you wish to overwrite the existing memory dump? (y/n)"
        read overwrite
        if [ "$overwrite" == "y" ]; then
            echo "Overwriting the existing memory dump..."
        elif [ "$overwrite" == "n" ]; then
            echo "Do you wish to continue with the old memory dump? (y/n)"
            read continue
            if [ "$continue" == "y" ]; then
                echo "Continuing with the old memory dump..."
                export memory_dump="$(ls | grep ".dmp")"
                return
            elif [ "$continue" == "n" ]; then
                echo "Continuing Script..."
            else
                echo "Invalid input. Continuing with the old memory dump..."
                export memory_dump="$(ls | grep ".dmp")"
                return
            fi
        else
            echo "Please enter a valid input."
        fi
    else
        echo "There is no existing memory dump in the $investigation_name directory. Continuing with the script..."
    fi

    # Create a memory dump of the computer and store it in the investigation directory
    echo "Creating a memory dump of the computer..."
    sudo vol.py -f $image_file --profile=Win7SP1x64 dumpfiles -Q 0x1e0 -D $investigation_path
    echo "The memory dump has been stored in the $investigation_name directory."
    echo "The memory dump is named $(ls | grep ".dmp")"
    export memory_dump="$(ls | grep ".dmp")"
    echo "---------------------------------------------------------------------------------------------------------"
    return
}


# Use foremost to analyze the target storage device, recover any deleted files, perform a deep analysis of the data, and extract any files that can be recovered to the target directory
foremost_function(){
    echo "Step #6: foremost was run on $(date)"
    # Echo current path
    echo "The current path is $PWD"
    echo ""
    echo "This is a tool used to recover deleted files from a storage device. The results of the analysis will be stored in a directory called foremost_results."

    # Specify image file from global variable
    image_file="$image_file"

    if [ ! -f "$image_file" ]; then
    echo "Error: The image file '$image_file' does not exist."
    exit 1
    fi

    # Create a directory to store the results of the foremost analysis, does not have to be unique. If the directory already exists, ask the user if they want to continue with the existing directory. If they do, continue with the script. If they do not, ask the user if they want to overwrite the existing directory. If they do, ask the user what new name they want to give. If they do not, continue with old directory.
    if [ -d "foremost_results" ]; then
        echo "The foremost_results directory already exists."
        echo "Do you wish to continue with the existing directory? (y/n)"
        read continue
        if [ "$continue" == "y" ]; then
            echo "Continuing with the existing directory..."
            return
        elif [ "$continue" == "n" ]; then
            echo "Do you wish to overwrite the existing directory? (y/n)"
            read overwrite
            if [ "$overwrite" == "y" ]; then
                echo "Overwriting the existing directory..."
                rm -r foremost_results
                mkdir foremost_results
                foremost -v -T -t all -i $image_file -o foremost_results
            elif [ "$overwrite" == "n" ]; then
                echo "Continuing with the existing directory..."
                return
            else
                echo "Please enter a valid input."
            fi
        else
            echo "Please enter a valid input."
        fi
    else
        echo "Creating the foremost_results directory..."
        mkdir foremost_results
    fi

    #foremost -v -T -t all -i $image_file -o foremost_results
    return
}

# Recursively traverse any images recovered by foremost and bulk-extractor and see if they have any embedded pictures. Needs work and does not work with PNGs.
steganography(){
    echo "Step #7: steganography was run on $(date)"
    # Set the directory to traverse
    dir="/media/msdoolan0718/One Touch/test2/bulk_extractor_images"

    # Loop through each file in the directory
    for file in "$dir"/*; do
    # Check if the file is an image file
    if [[ "$file" =~ \.(jpg|jpeg|png)$ ]]; then
        # Use steghide to perform reverse steganography
        steghide extract -sf "$file" -xf "$dir/$(basename "$file" | cut -d. -f1).txt" -p ""
        # Check if a file was extracted
        if [ -f "$dir/$(basename "$file" | cut -d. -f1).txt" ]; then
        # Create a new directory for the steg picture and original image(s)
        mkdir "$dir/$(basename "$file" | cut -d. -f1)_steg"
        mv "$file" "$dir/$(basename "$file" | cut -d. -f1)_steg/"
        mv "$dir/$(basename "$file" | cut -d. -f1).txt" "$dir/$(basename "$file" | cut -d. -f1)_steg/"
        # If the original image was a PNG, also move its associated alpha channel
        if [[ "$file" =~ \.png$ ]]; then
            mv "${file%.png}.png" "$dir/$(basename "$file" | cut -d. -f1)_steg/"
        fi
        fi
    fi
    done

}
#autopsy_automation(){
#Create a case file: In Autopsy, a case file is a container that holds all the digital evidence related to a specific investigation. 
# To create a case file, you can use the following command in the terminal
#sudo autopsy -c /path/to/casefile

# Add data sources: Once you have created a case file, you can add data sources to it. Data sources can include disk images, 
# individual files, or directories. You can use the following command to add data sources to the case file:
#sudo autopsy -c /path/to/casefile -i /path/to/datasource

# Replace /path/to/casefile with the location of the case file you created in step 2, and /path/to/datasource with the location of the data source you want to add.
# Analyze data sources: After you have added data sources to the case file, you can analyze them using Autopsy's built-in analysis tools. 
# To automate the analysis of data sources, you can use the following command:
#sudo autopsy -c /path/to/casefile -m

# This command will launch Autopsy's automated analysis module, which will analyze all the data sources in the case file.
# Generate reports: Once the analysis is complete, you can generate reports using Autopsy's reporting feature. 
# To automate the generation of reports, you can use the following command:
#sudo autopsy -c /path/to/casefile -r /path/to/report

# Use autopsy to find all images in a file system and copy file paths to a text file
# sudo autopsy -c /path/to/casefile -r /path/to/report -k "SELECT * FROM tsk_files WHERE mime_type LIKE 'image/%'

# Replace /path/to/casefile with the location of the case file, and /path/to/report with the location where you want to save the report.
# By automating these steps, you can save time and increase efficiency in your digital forensics investigations using Autopsy.
#}

# Pull the browser history from the image file. I do not know how this tool works yet, would like to know more about it before I use it.
browser_history(){
    echo "Step #8: browser-history was run on $(date)"
    #Tool: https://github.com/browser-history/browser-history
    #Tool for extracting browser history
    # We can do this from an image file 
    echo "This is a tool used to extract browser history from major browsers. The history will be stored in a csv file (excel spreadsheet)."
    echo " "
    echo "This tool only displays if the browser is not installed on the computer. If the browser is installed, the history will be extracted in the csv file."
    browser-history -o webhistory.csv
    # List all the browsers that have been installed on the computer and which ones have history
    echo "Browser history has been extracted and stored in the $investigation_name directory as webhistory.csv" 
    echo "---------------------------------------------------------------------------------------------------------"
    return
}

main(){  
    ascii_art
    tool_installation  
    # Where to store it
    case_path
    echo "The case path is $investigation_path"
    # What device you want to analyze
    target_device
    echo "The target device is $storage_device"
    # Image the device
    image_function
    bulk_extractor
    # memory_dump
    foremost_function
    #   steganography
    browser_history
}

main