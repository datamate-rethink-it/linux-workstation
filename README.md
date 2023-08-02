## linux-workstation
manage a debian12 desktop enviroment with $ansible-pull
ziel: kein artefakt und kein provisionerungsserver

### basis debian12 installation
1. Graphical install
2. Sprache: Deutsch
3. Standort: Deutschland
4. Tastatur: Deutsch
5. Netzwerk-Scnittstelle: Ethernet
6. Rechnername: $USER-debian
7. Domain-Name: leer lassen
8. Rot-Passwort: 
9. Name des Benutzers: $USER
10. Benutzername: $USER (nur Kleinbuchstaben)
11. Festplatte partionieren: 
    - Geführt - gesamte Platte verwenden (ext4)
    - SWAP-Partition löschen 
    - boot-Partition erstellen (500MB ext4)
    - Datenträger verschlüsseln
12. Netzwerkspiegel nicht verwenden
13. Nicht an der Paketumfrage teilnehmen
14. GNOME installieren


### ansible-pull usage
1. `su -l` 

2. `adduser USERNAME sudo`            

3. restart pc

4. go in `/etc/apt/sources.list` and add the content of the [sources.list](https://github.com/datamate-rethink-it/linux-workstation/blob/main/files/sources.list)

5. `sudo apt update` & `sudo apt upgrade`

6. `sudo apt install wget`

7. `wget https://github.com/datamate-rethink-it/linux-workstation/raw/main/bootstrap.sh`

8. `sudo chmod +x bootstrap.sh`

9. `./bootstrap.sh`

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
- [x] bootstrap.sh
- [ ]
