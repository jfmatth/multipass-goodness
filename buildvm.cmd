@echo off
:: Given a name and type, we'll build a VM for the user

:: params: %1 - Name, %2 - Type of VM

:: fail if parameters are blank
IF "%1"=="" GOTO help
IF "%2"=="" GOTO help

:: CMD's case statement
GOTO %2

:nano
    ECHO Building nano sized VM (1cpu x 1g x 25g) %1 / Importing keys / updating files, Stand by...
    multipass launch --name %1 --cpus=1 --mem=1g --disk=25gb
    GOTO cleanup
:std
    ECHO Building standard sized VM (1cpu x 2g x 25g) %1 / Importing keys / updating files, Stand by...
    multipass launch --name %1 --cpus=1 --mem=2g --disk=25gb
    GOTO cleanup
:big
    ECHO Building big sized VM (2cpu x 4g x 50g) %1 / Importing keys / updating files, Stand by...
    multipass launch --name %1 --cpus=2 --mem=4g --disk=50gb
    GOTO cleanup

:cleanup
    multipass exec %1 -- ssh-import-id gh:jfmatth
    multipass exec %1 -- sudo apt-get update -y
    multipass exec %1 -- sudo apt-get upgrade -y

GOTO end

:help
    ECHO.
    ECHO buildvm.cmd {name} {size}
    ECHO {name} - name of the VM
    ECHO {size} - nano(1x1), std(1x2), big(2x4)
    ECHO.
:end