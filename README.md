## linux-workstation
Define a debian12 desktop enviroment without an artifact or provisioning-server via $ ansible-pull

### usage with debian 12 already running on the workstation
`ansible-playbook local.yml --ask-become-pass -e "user=$USER"`

### base image
https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/

### base debian12 install
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
- [ ] move from README.md todo to github issues
- [ ] switch branchprune script to binary install from external source
- [ ] add shell extensions and pinned icons (gnome configuration via standard gnome extension install + script)
- [ ] explore preseed config to streamline debian install
- [ ] streamline post install with a wrapper / bootstrap.sh
- [ ] add geany customization
`sudo flatpak override --env=GTK_THEME=Adwaita:dark org.geany.Geany`
https://www.geany.org/download/themes/
/var/lib/flatpak/app/org.geany.Geany/x86_64/stable/active/share/geany/colorschemes/
- [ ] add ansible schmea higlighting for main.yml files / add to vscode settings.json
    "files.associations": {
        "main.yml": "ansible",
  },
