# termux

Este é um repositório para os meus scripts para termux.

## Configuração inicial

Seguem os comandos que utilizo ao instalar o termux.

```bash
# Atualizar e baixar pacotes
apt update
apt upgrade
apt install nano wget ncurses-utils coreutils gnupg
# Atalhos
mkdir .termux
cat > $HOME/.termux/termux.properties <<EOF
extra-keys = [\
   ['$','{','}','(',')','<','>','#',';'],\
   ['ALT','HOME','END','BACKSLASH','-','+','APOSTROPHE','&','BKSP'],\
   ['CTRL','TAB','|','/','LEFT','UP','DOWN','RIGHT','ESC']\
]
# Open a new terminal with ctrl + t (volume down + t)
shortcut.create-session = ctrl + t
# Go one session down with (for example) ctrl + 2
shortcut.next-session = ctrl + 2
# Go one session up with (for example) ctrl + 1
shortcut.previous-session = ctrl + 1
# Rename a session with (for example) ctrl + n
shortcut.rename-session = ctrl + n
# Ignore bell character (vibrate,beep,ignore)
bell-character=ignore
# Send the Escape key.
back-key=back
EOF
termux-reload-settings
# bashrc
wget https://raw.githubusercontent.com/ismaeldamiao/scripts/master/.bashrc
```

# Programação

* Para usar o gcc e o gfortran use o script [install-termux-cctools.sh](install-termux-cctools.sh)
* Para usar o jre e o jdk 9 use o script [java-arm.sh](java-arm.sh)
