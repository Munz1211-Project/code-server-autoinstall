#!/bin/bash

clear

#>> INSTALL CODE-SERVER
curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run; curl -fsSL https://code-server.dev/install.sh | sh

clear

#>> INPUT PASSWORD CODE-SERVER
read -p "Masukan password login code-server : " code

#>> CREATED SYSTEMD CODE-SERVER
cat > /lib/systemd/system/code-server.service <<END
[Unit]
Description=code-server
After=nginx.service

[Service]
Type=simple
Environment=PASSWORD=$code
ExecStart=/usr/bin/code-server --bind-addr 0.0.0.0:10 --user-data-dir /root/.local/share/code-server --auth password
Restart=always

[Install]
WantedBy=multi-user.target
END

#>> INSTALL PLUGIN CODE-SERVER
code-server --install-extension dbaeumer.vscode-eslint
code-server --install-extension FelixIcaza.andromeda
code-server --install-extension esbenp.prettier-vscode
code-server --install-extension CoenraadS.bracket-pair-colorizer

#>> CREATED FOLDER CODE-SERVER
mkdir -p /root/.local/share/code-server/User

#>> CUSTOM FONTS CODE-SERVER
cat > /root/.local/share/code-server/User/settings.json <<END
{
    "editor.fontFamily": "JetBrains Mono",
    "editor.fontLigatures": true,
    "terminal.integrated.fontFamily": "monospace",
    "editor.codeLensFontFamily": "'JetBrains Mono'",
    "window.menuBarVisibility": "toggle",
    "workbench.colorTheme": "Andromeda Bordered",
}
END

clear
#>> RUN SYSTEMD CODE-SERVER
sudo systemctl start code-server
clear

#>> ENABLED AUTO RESTART SYSTEMD CODE-SERVER
sudo systemctl enable code-server
clear

#>> CHECK SYSTEMD CODE-SERVER
sudo systemctl status code-server
