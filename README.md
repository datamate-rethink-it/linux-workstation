## linux-workstation
Define a debian12 desktop enviroment without an artifact or provisioning-server via $ ansible-pull

### image
https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/

### basis debian12 installation
1. Graphical install
2. Sprache: Deutsch
3. Standort: Deutschland
4. Tastatur: Deutsch
5. Netzwerk-Schnittstelle: Ethernet
6. Rechnername: <$user>-debian
7. Domain-Name: leer lassen
8. Root-Passwort:
9. Name des Benutzers: <$user>
10. Benutzername: <$user> (nur Kleinbuchstaben)
11. Festplatte partionieren:
    - Geführt - vollständige Festplatte verwenden
    - Festplatte auswählen
    - Alle Dateien auf eine Partition
    - SWAP-Partition löschen
    - boot-Partition erstellen (500MB ext4)
    - Verschlüsselte Datenträger konfigurieren
    - Verschlüsselte Datenträger erzeugen --> / als Einbindungspunkt der Partition auswählen
12. Netzwerkspiegel verwenden: Ja
    - Deutschland / deb.debian.org / kein Proxy
13. Nicht an der Paketverwendungserfassung teilnehmen
14. Debian desktop enviroment / GNOME / Standard Systemwerkzeuge installieren


### ansible-pull usage
1. `su -c "/usr/sbin/adduser <$user> sudo"`
2. `su <$user>`
3. change sources.list
```
sudo apt-get install curl && \
sudo curl https://raw.githubusercontent.com/datamate-rethink-it/linux-workstation/main/roles/linux-workstation/files/sources.list -o sources.list && \
sudo chmod 644 sources.list && sudo chown root: sources.list && \
sudo mv -f sources.list /etc/apt/sources.list
```
4. run ansible-pull
```shellscript
sudo apt-get -y install git ansible && \
ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean --ask-become-pass
```

### todo
- [ ] add shell extensions and pinned icons (gnome configuration via standard gnome extension install + script)
- [ ] explore preseed config to streamline debian install

- [x] streamline after debian install / bootstrap.sh & command
- [x] install jetbrains mono font
- [x] add min, max close window buttons in the top right corner & shortcuts
- [x] add installation of task/taskfile https://taskfile.dev/installation/ deb or tar.gz via github latest / no repos that we know of, so needs another install logic/method
https://github.com/go-task/task/releases/latest/download/task_linux_amd64.deb
- [x] remove all non wanted apps (games, ..) still on the system from base debian + gnome install
some remain, better solved with minimal image
- [x] add installation of terraform
- [x] add installation of seafile
- [x] debug installation of teamviewer
