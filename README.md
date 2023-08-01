## linux-workstation
manage my own personal debian desktop enviroment with $ansible-pull

### usage
`ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean`

### requirements before $ansible-pull
- add user to sudo and reboot ($PATH only includes usermod if  escalated via "$su -")
- add all non free sources https://wiki.debian.org/SourcesList or via Software&Updates
- install ansible via apt / just to bootstrap
- install git via apt

### TODO

list&task is with dme

- [x] Kickoff fixes (README & iterate.sh) before dme takes over
- [ ] populate this list & order it with aco
- [ ] add installation of task/taskfile https://taskfile.dev/installation/ deb or tar.gz via github latest / no repos that i know of so needs another isntall logic/method
https://github.com/go-task/task/releases/latest/download/task_linux_amd64.deb
