# syncSCP.sh
# scp to send files from server1 to server2
# -----------------------------------------------------------------------------------------
# syncSCP.sh - scp to download reports and data packages from server1 to server2
#   This will us ssh to send files from server1 to server2
#
# Usage: syncSCP.sh [localPath] [remotePath] [OutputLogFile]
#
# Parms: $1 [localPath]
#           The path to the folder containing exports - e.g. /.../syncExport
#        $2 [remotePath]
#           The path where downloading files to - e.g. /.../syncImport
#        $3 [OutputLogFile]
#           The output file to log information
# -----------------------------------------------------------------------------------------
