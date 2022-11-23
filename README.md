# Robot
Robot Framework General Collection

## Description
This is a generic repository for robot framework drafting.

> Note: 
This is an initial draft.

## Install

```
// Update apt repo
sudo apt-get update

// Install vlc player
sudo apt-get install vlc

// Install python
sudo apt-get install python3

// Install python package manager
sudo apt-get install python3-pip

// Install robot framework
pip3 install robotframework

// Create reference folder
mkdir ~/Documents/@projects
mkdir ~/Documents/@projects/robotframework

// Export Path to run "robot" command
echo $PATH
export PATH="/home/user/.local/bin:$PATH"
echo $PATH
```

## Execute 
```
// Option A - Path based
robot ~/Documents/@projects/robotframework/tv/tv_check_extended.robot 

// Option B - Non Path based
python3 -m robot ~/Documents/@projects/robotframework/tv/tv_check_extended.robot 
```

