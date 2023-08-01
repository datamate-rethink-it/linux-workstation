## linux-workstation
manage a debian desktop enviroment with $ansible-pull
ziel: kein artefakt und kein provisionerungsserver

### usage
`wget https://github.com/datamate-rethink-it/linux-workstation/raw/main/bootstrap.sh`



`ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean`

### requirements before $ansible-pull
- add user to sudo and reboot? ($PATH only includes usermod if  escalated via "$su -")
- install ansible via apt / just to bootstrap
- install git via apt

- add all non free sources https://wiki.debian.org/SourcesList or via Software&Updates
### TODO

list&task is with dme

- [x] Kickoff fixes (README & iterate.sh) before dme takes over
- [ ] populate this list & order it with aco
- [ ] add installation of task/taskfile https://taskfile.dev/installation/ deb or tar.gz via github latest / no repos that I know of so needs another install logic/method
https://github.com/go-task/task/releases/latest/download/task_linux_amd64.deb
- [ ] bootstrap.sh
- [ ]


Debian Install Definition
- Systemsprache Deutsch
- GNOME Desktop
- keine Swap Partition
- one big standard ext4 partiton
- verschlüsselte partition (selbst setzbar ?)
- definieren und mitgeben ? ^^ -> kommandozeilenparameter, unintended debian installation.
- 





