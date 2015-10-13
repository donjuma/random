Add `punishment.sh`, `.bashrc_punishment`, and `.bashrc_fate` to the defendant's homedir. Change the value of the `PLAINTIFF` variable to your name (or your fall guy's name).

Additionally, add these lines to their .bashrc (or similar profile script that gets executed on login):

    . .bashrc_fate
    . .bashrc_punishment
