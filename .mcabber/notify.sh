#!/bin/bash

NOTIFY_BIN=/usr/local/bin/growlnotify

event=$1
arg1=$2
arg2=$3
filename=$4

if [ $event == "MSG" ]; then
    case "$arg1" in
        IN)
            # Incoming message from buddy $arg2
            if [ -n "$filename" -a -f "$filename" ]; then
                MSG=$(cat "$filename")
                $NOTIFY_BIN -n "mcabber" -m "$MSG" "Message from $arg2"
                /bin/rm $filename
            else
                $NOTIFY_BIN -n "mcabber" -m "Message from $arg2" "Incoming Message"
            fi
            ;;
        MUC)
            # Groupchat message in room $arg2
            if [ -n "$filename" -a -f "$filename" ]; then
                MSG=$(cat "$filename")
                $NOTIFY_BIN -n "mcabber" -m "$MSG" "Message in $arg2"
                /bin/rm $filename
            else
                $NOTIFY_BIN -n "mcabber" -m "Message in room $arg2" "Groupchat Message"
            fi
            ;;
        OUT)
            # Outgoing message for buddy $arg2
            # $NOTIFY_BIN -n "mcabber" -m "Message for: $arg2" "Outgoing Message"
            ;;
    esac
elif [ $event == "STATUS" ]; then
    # Buddy $arg2 status is $arg1 (_, O, I, F, D, N, A)
    # $NOTIFY_BIN -n "mcabber" -m "Buddy $arg2 has set status $arg1" "Status Change"
    echo > /dev/null
fi
