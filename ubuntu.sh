#!/data/data/com.termux/files/usr/bin/bash

dir="ubuntu-fs"
tarball="ubuntu.tar.gz"
bin="start-ubuntu.sh"

# Arquitetura do processador
arch="$(dpkg --print-architecture)"

if [ "${arch}" == "aarch64" ]; then
   arch="arm64"
elif [ "${arch}" == "arm" ]; then
   arch="armhf"
elif [ "${arch}" == "amd64" ] || [ arch == "x86_64" ]; then
   arch="amd64"
elif [ "${arch}" == "i*86" ]; then
   arch="i386"
else
   echo "Arquitetura nao reconhecida"
   exit 255
fi

# Baixar imagam do ubuntu
echo "Baixando imagem do ubuntu"
[ -e ${tarball} ] && rm ${tarball}
wget -qO ${tarball} "https://partner-images.canonical.com/core/bionic/current/ubuntu-bionic-core-cloudimg-${arch}-root.tar.gz"

# Descompactar imagem
echo "Descompactando imagem"
[ -d ${dir} ] && rm ${dir}
mkdir ${dir}
cd ${dir}
proot --link2symlink tar -xf ../${tarball} --exclude='dev'||:
echo "nameserver 1.1.1.1" > etc/resolv.conf
cd ..

# Escrevendo script de execucao
[ -e ${bin} ] && rm ${bin}
cat > ${bin} <<EOF
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r ${dir}"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOF

[ -e ${HOME}/.bashrc ] && cp $HOME/.bashrc ${dir}/root

termux-fix-shebang ${bin}
chmod 755 ${bin}

echo "Você já pode iniciar o ubuntu digitando ./${bin}"

exit 0
