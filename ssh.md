# ssh

# Instale o ssh

```bash
apt update && apt install -y openssh
```

# Configure o ssh

Como sugestão faça

```bash
if [ -e $PREFIX/etc/ssh_config ]; then rm $PREFIX/etc/ssh/ssh_config; fi
echo "Host *" >> $PREFIX/etc/ssh/ssh_config
echo "   Port 22" >> $PREFIX/etc/ssh/ssh_config

if [ -e $PREFIX/etc/ssh/sshd_config ]; then rm $PREFIX/etc/ssh/sshd_config; fi
echo "Port 2225" >> $PREFIX/etc/ssh/sshd_config
```
# Configure sua senha

```bash
passwd
```
