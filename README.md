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

// Install git
sudo apt-get install git

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

// Download robot framework sample scripts
cd ~/Documents/@projects/robotframework
git clone https://github.com/enickel/robot.git

```

## Execute 
```
// Option A - Path based
robot ~/Documents/@projects/robotframework/robt/tv/tv_check_extended.robot 

// Option B - Non Path based
python3 -m robot ~/Documents/@projects/robotframework/robot/tv/tv_check_extended.robot 
```

## Check report  
```
firefox ~/Documents/@projects/robotframework/tv/report.html
```
> Note: 
> The path of the report can be found in the end of the test execution output. 
> e.g. 
```
...
Ping para cota-b.cdn.telefonica.com                                   | PASS |
------------------------------------------------------------------------------
Validate channel - 239.128.1.207                                      | PASS |
------------------------------------------------------------------------------
Tv Check Extended :: Enickel IPTV Quick Check                         | PASS |
30 tests, 30 passed, 0 failed
==============================================================================
Output:  /home/user/Documents/@projects/robotframework/tv/output.xml
Log:     /home/user/Documents/@projects/robotframework/tv/log.html
Report:  /home/user/Documents/@projects/robotframework/tv/report.html
user@nkl:~/Documents/@projects/robotframework/tv$
```

