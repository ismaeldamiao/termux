## Servidor

Primeiro vamos baixar o x:

```bash
apt install -y x11-repo
```

Agora vamos baixar o servidor vnc e um gestor de janelas fluxbox:

```bash
apt install -y fluxbox tigervnc
```

Vamos configurar o fluxbox para iniciar junto com o vnc:

```bash
if [ -e ~/.vnc/xstartup ]; then rm ~/.vnc/xstartup; fi
if ! [ -d ~/.vnc ]; then mkdir ~/.vnc; fi

cat > ~/.vnc/xstartup <<EOF
#!/data/data/com.termux/files/usr/bin/sh
## Fluxbox desktop.

# Generate menu.
fluxbox-generate_menu

# Start fluxbox.
fluxbox &
EOF
```

Para configurar uma senha para o servidor vnc use:

```bash

vncserver -localhost
```

## Cliente
