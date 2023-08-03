## linux-workstation
Define a debian12 desktop enviroment without an artifact or provisioning-server via $ ansible-pull

### basis debian12 installation
1. Graphical install
2. Sprache: Deutsch
3. Standort: Deutschland
4. Tastatur: Deutsch
5. Netzwerk-Scnittstelle: Ethernet
6. Rechnername: $USER-debian
7. Domain-Name: leer lassen
8. Root-Passwort:
9. Name des Benutzers: $USER
10. Benutzername: $USER (nur Kleinbuchstaben)
11. Festplatte partionieren:
    - Geführt - vollständige Festplatte verwenden
    - Festplatte auswählen
    - Alle Dateien auf eine Partition
    - SWAP-Partition löschen
    - boot-Partition erstellen (500MB ext4)
    - Verschlüsselte Datenträger konfigurieren
    - Verschlüsselte Datenträger erzeugen --> / als Einbindungspunkt der Partition auswählen
12. Netzwerkspiegel nicht verwenden
13. Nicht an der Paketverwendungserfassung teilnehmen
14. GNOME installieren


### ansible-pull usage
1. `su -l`

2. `adduser USERNAME sudo`

3. ***reboot***

4. go in `/etc/apt/sources.list` and add the content of [sources.list](https://github.com/datamate-rethink-it/linux-workstation/blob/main/files/sources.list)

5. `sudo apt update`

6. `sudo apt upgrade`

7. `sudo apt install wget`

8. `wget https://github.com/datamate-rethink-it/linux-workstation/raw/main/bootstrap.sh`

9. `sudo chmod +x bootstrap.sh`

10. `./bootstrap.sh`

### todo
- [ ] streamline after debian install / bootstrap.sh & command
- [ ] add installation of task/taskfile https://taskfile.dev/installation/ deb or tar.gz via github latest / no repos that we know of, so needs another install logic/method
https://github.com/go-task/task/releases/latest/download/task_linux_amd64.deb
- [ ] add installation of terraform
- [ ] debug installation of teamviewer
- [ ] add shell extensions and pinned icons (gnome configuration)
- [ ] explore preseed config to streamline debian install
- [ ] remove all non wanted apps (games, ..) still on the system from base debian + gnome install
