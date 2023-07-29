## linux-workstation
manage my own personal debian desktop enviroment with $ansible-pull

### use
`$ansible-pull -U https://github.com/anconrad/linux-workstation -e "user=$USER"`

### requirements before $ansible-pull
- add main user to sudo and reboot ($PATH only includes usermod if  escalated via "$su -")
- add all non free sources https://wiki.debian.org/SourcesList or via Software&Updates
- install nvidia drivers $sudo apt install nvidia-drivers
- install ansible via apt / just to bootstrap
