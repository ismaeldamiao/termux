#!/data/data/com.termux/files/usr/bin/bash

# arch="$(dpkg --print-architecture)"
apt update

hash -d wget # Forgets the BusyBox wget path so new one is used

# Java Runtime Environment
wget https://archive.org/download/openjdk-9-jre-headless_9.2017.8.20-1_x86_64/openjdk-9-jre-headless_9.2017.8.20-1_arm.deb
apt install -y ./openjdk-9-jre-headless_9.2017.8.20-1_arm.deb

# Java Developer Kit
wget https://archive.org/download/openjdk-9-jre-headless_9.2017.8.20-1_x86_64/openjdk-9-jdk-headless_9.2017.8.20-1_arm.deb
apt install -y ./openjdk-9-jdk-headless_9.2017.8.20-1_arm.deb

rm openjdk-9-jdk-headless_9.2017.8.20-1_arm.deb
