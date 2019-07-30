#!/bin/sh

#  Figure out where we're being called from
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Quote the path to handle folders with special characters
COMMAND_PATH="\"$DIR/upload-symbols\" "

echo "_____________CUSTOM COMMAND___________"
echo "++++++++++++ UPLOAD DSYM +++++++++++++"
echo "Given Arguments:"
echo $@

echo ""
echo "COMMAND PATH:"
echo $COMMAND_PATH


ARGUMENTS="-d -p ios -gsp $@"

VALIDATE_ARGUMENTS="$ARGUMENTS --validate"



echo "START TO VALIDATE"
eval $COMMAND_PATH$VALIDATE_ARGUMENTS
return_code=$?

if [[ $return_code != 0 ]]; then
  exit $return_code
fi

#  Verification passed, convert and upload cSYMs in the background to prevent
#  build delays
#
#  Note: Validation is performed again at this step before upload
#
#  Note: Output can still be found in Console.app, by searching for
#        "upload-symbols"
#
echo "START TO UPLOAD"
eval $COMMAND_PATH$UPLOAD_ARGUMENTS > /dev/null 2>&1 &



echo "------------ UPLOAD DSYM FNISHED ------------"

