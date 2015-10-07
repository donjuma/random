#!/bin/bash

myname=$(whoami)
correct1="I WILL NEVER USE OMARS MACHINE AGAIN"
correct2="I WILL ALSO NEVER CHANGE HIS TTY AGAIN"

whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "This is why you dont use Omar's machine" 8 78

whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "Your name has been added to Omar's naughty list..." 8 78

if (whiptail --title "Will you seek forgiveness?" --yes-button " Yes, I'm sorry. " --no-button " I regret nothing. " --yesno "Do you wish to be removed from Omar's naughty list?" 8 78) then
    whiptail --title "This is why you don't use Omar's machine" --msgbox "You must prove you really are sorry." 8 78
    response1=$(whiptail --title "Test Question 1" --inputbox "Please enter the following EXACTLY as shown: \nI WILL NEVER USE OMARS MACHINE AGAIN" 8 78 3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        if [ "$response1" != "$correct1" ]; then
            echo "FAIL"
            whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "FAIL: You are still naughty" 8 78
            logout
        else
            echo "PASS"
            response2=$(whiptail --title "Test Question 2" --inputbox "Please enter the following EXACTLY as shown: \nI WILL ALSO NEVER CHANGE HIS TTY AGAIN" 8 78 3>&1 1>&2 2>&3)
            exitstatus2=$?
            if [ $exitstatus2 = 0 ]; then
                if [ "$response2" != "$correct2" ]; then
                    echo "FAIL"
                    whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "FAIL: You are still naughty" 8 78
                    logout
                else
                    echo "PASS"
                    whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "You have been forgiven. Please don't enter my naughty list again..." 8 78
                    whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "USER: ${myname} has been removed from GROUP: naughty" 8 78

                    #Remove the last line from the user's BashRC
                    sed -i '$d' ~/.bashrc
                fi
            else
                echo "YOU HIT CANCEL"
                whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "FAIL: You are still naughty" 8 78
                logout
            fi
        fi
    else
        echo "You hit cancel"
        whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "FAIL: You are still naughty" 8 78
        logout
    fi
else
    echo "Logging you off"
    whiptail --title "DO NOT USE OMAR'S MACHINE" --msgbox "FAIL: You are still naughty" 8 78
    logout
fi


