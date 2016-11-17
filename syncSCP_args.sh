#!/bin/bash
# -----------------------------------------------------------------------------------------
# Parameters/Arguments Check
# -----------------------------------------------------------------------------------------

# $1 [OutputFile]
# Log messages to file passed in or to Standard Out
if [ -z $1 ]; then # true if length of string is zero
  logFile=/dev/stdout
else
  logFile=$1
fi

# -----------------------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------------------

{
  sciSCPScriptDir=/<directory_where_syncSCP.sh>/
  localDir=/local_dir/ # local
  remoteDir=/remote_dir/ # remote
  $sciSCPScriptDir/sciSCP.sh $localDir $remoteDir $logFile
}
