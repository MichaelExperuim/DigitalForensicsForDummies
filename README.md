Title: DigitalForensicsForDummies

Developers: Michael (MichaelExperuim) and Peyton (not listed)
Honorable Mentions: Ancil (jachan-san)

This script will be used to simplify and automate some of the processes of a standard digital forensics for low income and digitally illiterate law enforcement agencies wishing to have basic competencies in digital forensics. 

This code is a part of a research and school project, developed for a forensics class at Embry-Riddle Aeronautical University, Prescott campus. Reference the following word doc for the full research paper. 

The code does the following:

1. Downloads the necessary tools and dependencies to run this script
  a. NOTE: The code first checks if you have the necessary tools and dependencies to run this before 
     it downloads them.
2. Requires the user to select a storage device and location to store their results in
  a. NOTE: The storage device must be larger than the image file, otherwise, code will terminate
3. Requires the user to specify a target storage device to analyze
  a. NOTE: Do not image your storage device and store it on your own storage device, that is stupid
4. Images the storage device
  a. NOTE: Can take an extremely long time. If you already made an image of the device, put it in the 
     same directory as the code. The code checks for an image file so you don't have to create a new one
     each time. 
5. Runs the following digital forensics tools. Bulk-extractor, Foremost, Steghide, and browser-history.
  a. Bulk-extractor, used to collect and pull various information, including but not limited too, credit cards, emails, and images from an image file. This information could be valuable in a digital forensics investigation for law enforcement.
  b. Foremost is used for file recovery. The tool recovers any deleted files that it can and puts them in a separate folder. I am not entirely sure its effectiveness, but in a test, I was able to recover images from approximately 2 years ago from a wiped flash drive.
  c. Steghide, traverses the outputs from foremost and bulk-extractor for any images and attempts to extract any hidden data. Currently, does not work on PNGs and only extracts other images.
6. Outputs the results and a summary file in their respective directories, with pictures given their own separate folder. 

NOTE: The team who developed this considers this project finished and will not be working on it in the foreseeable future. Certain features do not work, specifically hashing and memory analysis. DO NOT USE THIS IN A PRODUCTION ENVIROMENT.
