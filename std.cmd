if "%1"=="" GOTO END
    multipass launch --name %1 --cpus=1 --mem=2g --disk=50gb
    multipass exec %1 -- ssh-import-id gh:jfmatth
    multipass exec %1 -- sudo apt-get update -y
    multipass exec %1 -- sudo apt-get upgrade -y
:end