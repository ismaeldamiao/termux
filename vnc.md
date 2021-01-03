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
exec fluxbox
EOF

chmod 755 ~/.vnc/xstartup
```

Para iniciar servidor vnc use:

```bash
vncserver -localhost
```

Este comando deve pedir para criar uma senha e retornar uma pergunta a ser respondida com (n) e uma menssagem informando o id do servidor criado, como nos exemplos abaixo, respectivamente:

```bash
You will require a password to access your desktops.

Password:
Verify:
Would you like to enter a view-only password (y/n)? n
```

```bash
New 'localhost:1 ()' desktop is localhost:1

Creating default startup script /data/data/com.termux/files/home/.vnc/xstartup
Creating default config /data/data/com.termux/files/home/.vnc/config
Starting applications specified in /data/data/com.termux/files/home/.vnc/xstartup
Log file is /data/data/com.termux/files/home/.vnc/localhost:1.log
```

Neste caso o id é 1 e servirá para calcular a porta que é `5900+id`, neste caso `5901`.

Por fim redirecione a saída dos processos gráficos para seu servidor com:

```bash
export DISPLAY=":1"
```

Lembrando de trocar o `1` pelo id do seu servidor.

Note que os dois últimos comandos devem ser executados sempre que o servidor for reiniciado.

## Cliente

Há muitas formas de conectar o servidor ao cliente, você pode redirecionar a porta através do roteador (não recomendo) ou simplesmente acessar pela rede local desde outro pc.

Irei mostrar como configurar um cliente no próprio android.

Baixe o [MultiVNC](https://f-droid.org/pt_BR/packages/com.coboltforge.dontmind.multivnc/) e abra ele. Onde tem `Adress` coloque `localhost` e onde tem `Port` coloque a porta, nesse caso 5901.
Em `Password` coloque a senha e clique em `connect`.
