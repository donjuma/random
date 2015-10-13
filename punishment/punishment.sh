#!/usr/bin/env bash

# Make sure the environment variable PLAINTIFF is set. Otherwise, assume
# someone pissed off Omar again.
[ -n "${PLAINTIFF}" ] || export PLAINTIFF="Omar"
all_caps_plaintiff=$(echo "${PLAINTIFF}" | tr '[:lower:]' '[:upper:]')
if [ ${PLAINTIFF} = 'Bethany' ] ; then
    pronoun='her'
else
    pronoun='his'
fi
all_caps_pronoun=$(echo "${pronoun}" | tr '[:lower:]' '[:upper:]')


title="DO NOT USE ${all_caps_plaintiff}'S MACHINE"
reproach="FAIL: You are still naughty"

myname=$(whoami)
correct1="I WILL NEVER USE ${all_caps_plaintiff}'S MACHINE AGAIN"
correct2="I WILL ALSO NEVER CHANGE ${all_caps_pronoun} TTY AGAIN"


scold () {
    whiptail --title "${title}" --msgbox "${reproach}" 8 78
    exit 1
}

whiptail --title "${title}" --msgbox "This is why you dont use ${PLAINTIFF}'s machine" 8 78
whiptail --title "${title}" --msgbox "Your name has been added to ${PLAINTIFF}'s naughty list..." 8 78

whiptail --title "Will you seek forgiveness?" --yes-button " Yes, I'm sorry. " --no-button " I regret nothing. " --yesno "Do you wish to be removed from ${PLAINTIFF}'s naughty list?" 8 78 || scold
whiptail --title "This is why you don't use ${PLAINTIFF}'s machine" --msgbox "You must prove you really are sorry." 8 78

response1=$(whiptail --title "Test Question 1" --inputbox "Please enter the following EXACTLY as shown: \n${correct1}" 8 78 3>&1 1>&2 2>&3 || scold)
[ "${response1}" = "${correct1}" ] || scold

response2=$(whiptail --title "Test Question 2" --inputbox "Please enter the following EXACTLY as shown: \n${correct2}" 8 78 3>&1 1>&2 2>&3 || scold)
[ "${response2}" = "${correct2}" ] || scold

whiptail --title "${title}" --msgbox "You have been forgiven. Please don't enter my naughty list again..." 8 78
whiptail --title "${title}" --msgbox "USER: ${myname} has been removed from GROUP: naughty" 8 78

# Update unix-court case
echo "export PUNISH=\"false\"" >> .bashrc_fate
