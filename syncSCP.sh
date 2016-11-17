#!/bin/bash
# -----------------------------------------------------------------------------------------
# Parameters/Arguments Check
# -----------------------------------------------------------------------------------------

# $1 [localPath] - file/path where downloding files from
if [ -z $1 ]; then # true if length of string is zero
  errText="ERROR. No path to SCI files supplied to syncSCP.sh"
else
  localPath=$1
fi

# $2 [remotePath] - file/path where downloading files to
if [ -z $2 ]; then # true if length of string is zero
  errText="ERROR. No local file/path supplied to syncSCP.sh"
else
  remotePath=$2
fi

# $3 [OutputLogFile] - Log file passed in or Standard Output
if [ -z $3 ]; then # true if length of string is zero
  OutputLogFile="/tmp/sciSCP."`date +%Y%m%d%H%M`".log"
  userLogFile="false"
  echo "Created Temporary Outfile: $OutputLogFile" >> $OutputLogFile
else
  OutputLogFile=$3
  userLogFile="true"
fi

# decide if errText goes to log file or to Std Out
if [ -N "$errText" ]; then # true if file exists and has been modified since it was last read
  if userLogFile ; then
    echo "$errText" >> $OutputLogFile
  else
    echo "$errText"
  fi
  exit 0
fi


# -----------------------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------------------
function scpFiles {

remoteURL=$1
logFile=$2

echo "----------------------------------------------------" >> $logFile
echo "START" >> $logFile
date +"%T %a %D : $1" >> $logFile
echo "----------------------------------------------------" >> $logFile
echo "Secure Copy: $remoteURL" >> $logFile

# sshpass -p "<password>" <--- tried but decided to use ssh-keygen -t rsa
# append sdtout and stderr: cmd >> file.txt 2>&1
scp -r $localPath/* $remoteURL/  >> $logFile 2>&1

echo "----------------------------------------------------" >> $logFile
date +"%T %a %D : $1" >> $logFile
echo "END" >> $logFile
echo "----------------------------------------------------" >> $logFile
echo " " >> $logFile
}


# -----------------------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------------------

{
  # server2 IP or remote hostname
  remoteServerIP=remote_hostname
  urlToRemote="$USER@$remoteServerIP:$remotePath"
  echo "----------------------------------------------------" >> $OutputLogFile
  echo "Local Path: $1" >> $OutputLogFile #localPath
  echo "Destination Path: $2" >> $OutputLogFile #remotePath
  echo "Output Log File: $3" >> $OutputLogFile
  echo "Url to remote: $urlToRemote" >> $OutputLogFile

  scpFiles $urlToRemote $OutputLogFile
}
