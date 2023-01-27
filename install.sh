#!/bin/bash

curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run
curl -fsSL https://code-server.dev/install.sh | sh

mkdir -p /root/.config/code-server

read -p "Masukan password login code-server : " code

echo -e "bind-addr: 0.0.0.0:10
auth: password
password: $code
cert: false
" > /root/.config/code-server/config.yaml

code-server --install-extension dbaeumer.vscode-eslint
code-server --install-extension FelixIcaza.andromeda
code-server --install-extension esbenp.prettier-vscode
code-server --install-extension CoenraadS.bracket-pair-colorizer

mkdir -p /root/.local/share/code-server/User

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
