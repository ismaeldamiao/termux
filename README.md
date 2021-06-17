# termux

Este é um repositório para os meus scripts para termux.

Baixe o termux no [F-Droid](https://f-droid.org/repository/browse/?fdid=com.termux).

Baixe também um editor de arquivos que lhe permita gestionar os arquivos do termux. Recomendo o [Material Files](https://github.com/zhanghai/MaterialFiles). Veja mais na [termux wiki](https://wiki.termux.com/wiki/Internal_and_external_storage).

Também pode ser util um teclado virtual "de respeito". Recomendo o [AnySoftKeyboard](http://anysoftkeyboard.github.io/download/).

Para edição de códigos recomendo o [DroidEdit](https://play.google.com/store/apps/details?id=com.aor.droidedit).

# Configuração inicial

Após atualizar os pacotes, esses são os pacotes esenciais que instalo no termux:

```bash
apt update && apt upgrade -y
apt install -y nano wget ncurses-utils coreutils gnupg
```

Assim é como configuro as teclas especiais ([saiba mais](https://wiki.termux.com/wiki/Touch_Keyboard)):

```bash
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
```

E, como não pode faltar, baixo meu .bashrc:

```bash
wget https://raw.githubusercontent.com/ismaeldamiao/scripts/master/.bashrc
```

# Programação

* Para usar o gcc e o gfortran use o script [install-termux-cctools.sh](install-termux-cctools.sh)
* Para usar o jre e o jdk 9 use o script [java-arm.sh](java-arm.sh)

# Servidores

* Para configurar o ssh veja [ssh.md](ssh.md).
* Para configurar o vnc veja [vnc.md](vnc.md).

# CHROOT

Para usar o chroot instale o `proot` e execute o script [ubuntu.sh](ubuntu.sh).
