## linux-workstation
Define a debian12 desktop enviroment without an artifact or provisioning-server via $ ansible-pull

### basis debian12 installation
1. Graphical install
2. Sprache: Deutsch
3. Standort: Deutschland
4. Tastatur: Deutsch
5. Netzwerk-Scnittstelle: Ethernet
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
12. Netzwerkspiegel nicht verwenden
13. Nicht an der Paketverwendungserfassung teilnehmen
14. GNOME installieren


### ansible-pull usage
1. `su -l`
2. `adduser <$user> sudo`
3. ***reboot***

4. go in `/etc/apt/sources.list` and add the content of [sources.list](https://github.com/datamate-rethink-it/linux-workstation/blob/main/files/sources.list)
5. `sudo apt update`
6. `sudo apt upgrade`

7. Run ansible-pull as desktop <$user>
```console
sudo apt-get -y install git ansible && \
ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean
```

### todo
- [ ] add shell extensions and pinned icons (gnome configuration via standard gnome extension isntall + script)
- [ ] streamline after debian install / bootstrap.sh & command
- [ ] explore preseed config to streamline debian install

- [x] install jetbrains mono font
- [x] add min, max close window buttons in the top right corner & shortcuts
- [x] add installation of task/taskfile https://taskfile.dev/installation/ deb or tar.gz via github latest / no repos that we know of, so needs another install logic/method
https://github.com/go-task/task/releases/latest/download/task_linux_amd64.deb
- [x] remove all non wanted apps (games, ..) still on the system from base debian + gnome install
some remain, better solved with minimal image
- [x] add installation of terraform
- [x] add installation of seafile
- [x] debug installation of teamviewer
