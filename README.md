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
15. Install Grub: Ja
16. **Continue to reboot**

### ansible-pull usage
Login with <$user> / open a terminal
1. `su -c "/usr/sbin/adduser $USER sudo"`
2. `su $USER`
3. change sources.list
```
sudo apt-get install curl && \
sudo curl https://raw.githubusercontent.com/datamate-rethink-it/linux-workstation/main/roles/linux-workstation/files/sources.list -o sources.list && \
sudo chmod 644 sources.list && sudo chown root: sources.list && \
sudo mv -f sources.list /etc/apt/sources.list
```
4. run ansible-pull (BECOME Password = <$user> sudo Password)
```shellscript
sudo apt-get -y install git ansible && \
ansible-pull -U https://github.com/datamate-rethink-it/linux-workstation -e "user=$USER" --clean --ask-become-pass
```
5. **reboot**

6. Install Shell Extensions and pin Apps
https://extensions.gnome.org/extension/1462/panel-date-format/
https://extensions.gnome.org/extension/1160/dash-to-panel/

### todo
- [ ] add shell extensions and pinned icons (gnome configuration via standard gnome extension install + script)
- [ ] explore preseed config to streamline debian install
- [ ] streamline post install with a wrapper / bootstrap.sh
- [ ] add geany customization
`sudo flatpak override --env=GTK_THEME=Adwaita:dark org.geany.Geany`
https://www.geany.org/download/themes/
/var/lib/flatpak/app/org.geany.Geany/x86_64/stable/active/share/geany/colorschemes/
- [ ] add ll alias & standard terminal colors
- [ ] add git plumbing aliases (e.g. delete all local branches without a remote and prune origin)
`git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done``

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
