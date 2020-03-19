@echo off
if NOT "%1"=="" GOTO run
    ECHO You need to specify a name for your nano instance, i.e. nano smallone
    GOTO end
:run
    call buildvm.cmd  %1 nano

    REM ECHO Building nano sized VM (1cpu x 1g x 25g) %1 / Importing keys / updating files, Stand by...
    REM multipass launch --name %1 --cpus=1 --mem=1g --disk=25gb
    REM multipass exec %1 -- ssh-import-id gh:jfmatth
    REM multipass exec %1 -- sudo apt-get update -y
    REM multipass exec %1 -- sudo apt-get upgrade -y
:end