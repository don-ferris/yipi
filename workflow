Workflow/notes...

start container - run as root for initial setup
goto http://yipi.local
index.php [this php script is where the magic is] clones the latest version of the yipi setup script then begins to walk the user through guided setup.
When the last step of guided setup has completed, a full overview of the setup is presented, allowing the user to make any desired changes, then the script executes bash commands based on user choices/responses to create directories, config files, install software, and (if necessary) give the user a link and a simple, step-by-step procedure for setting up an account/etc. on some other website.
The final step of the setup script is to reboot the Yipi box.
When it comes back up, it will be fully configured and will run using the user account created during guided setup. (New root password will have been automatically generated during setup.)
