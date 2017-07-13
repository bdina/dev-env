#!/bin/bash

OS_NAME="`uname -s`"

# Absolute path to this script. /home/user/bin/foo.sh
if [ "$OS_NAME" == "Darwin" ]; then
    SCRIPT="`python -c "import os; print os.path.realpath('$0')"`"
else
    SCRIPT="$(readlink -f $0)"
fi

# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname "$SCRIPT"`
SCRIPTPATH=`echo "$SCRIPTPATH" | sed -e 's/\/\.$//g'`

INOTIFY_WAIT=`which inotifywait`
INOTIFY_FLAGS='-r -e modify -e attrib -e move -e move_self -e create -e delete -e delete_self -e unmount'
INOTIFY_VERBOSITY='-q -q'
INOTIFY_EXCLUDES='(\..*\.sw[px]|#.*#)'

FSWATCH_WAIT=`which fswatch`
FSWATCH_FLAGS='-r --one-event --monitor=fsevents_monitor'
#FSWATCH_VERBOSITY='-v'
FSWATCH_EXCLUDES='--exclude=(\..*\.sw[px]|#.*#)'

NOTIFY_SEND=`which notify-send`
GROWL_NOTIFY=`which growlnotify`

function notify-send {
    prio="normal"
    type="$1"
    # NOTE: Ubuntu currently disables the use of the timeout parameter
    expire="$2"
    message="Ant: $3"
    body="$4"
    
    if [ -e $GROWL_NOTIFY ]; then
        $GROWL_NOTIFY -p "$prio" -n "Ant" -t "$message" -m "$body"
    elif [ -e $NOTIFY_SEND ]; then
        $NOTIFY_SEND -u "$prio" -i "$type" -c Ant -t "$expire" "$message" "$body"
    else
        echo "--- $message
---   $body"
    fi
}

function wait-for-changes {
    if [ "$OS_NAME" == "Darwin" ]; then
        $FSWATCH_WAIT $FSWATCH_VERBOSITY $FSWATCH_FLAGS --exclude "$FSWATCH_EXCLUDES" . || exit 1
    else
        $INOTIFY_WAIT $INOTIFY_VERBOSITY $INOTIFY_FLAGS --exclude "$INOTIFY_EXCLUDES" . || exit 1
    fi
}

echo "--- Starting build loop at: 
---  '$SCRIPTPATH'"
pushd "$SCRIPTPATH" 2>&1 > /dev/null || exit 1

# Perform the build loop
while [[ 1 -eq 1 ]]; do
    notify-send "gtk-info" "3000" "Build started..." "Build started at `date`"

    ant clean || exit 1

    echo ""
    ant compile

    if [[ $? -eq 0 ]]; then
        notify-send "gtk-apply" "5000" "Build SUCCESSFUL!" "Build successfully finished at `date`"
    else
        notify-send "gtk-no" "10000" "Build FAILED!!!" "Build finished at `date`"
    fi
    
    wait-for-changes
done
