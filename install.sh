#!/bin/bash

curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run
curl -fsSL https://code-server.dev/install.sh | sh

mkdir -p /root/.config/code-server

echo -e "bind-addr: 0.0.0.0:10
auth: password
password: whatdoyouwant
cert: false
" > /root/.config/code-server/config.yaml

code-server --install-extension dbaeumer.vscode-eslint
code-server --install-extension FelixIcaza.andromeda
code-server --install-extension esbenp.prettier-vscode
code-server --install-extension CoenraadS.bracket-pair-colorizer

mkdir -p /root/.local/share/code-server/User

echo -e "{
    "editor.fontFamily": "JetBrains Mono",
    "editor.fontLigatures": true,
    "terminal.integrated.fontFamily": "monospace",
    "editor.codeLensFontFamily": "'JetBrains Mono'",
    "window.menuBarVisibility": "toggle",
    "workbench.colorTheme": "Andromeda Bordered",
}
" > /root/.local/share/code-server/User/settings.json
