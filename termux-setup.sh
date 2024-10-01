export URL=https://raw.githubusercontent.com/vivi7/docker-qemu-arm
export BRANCH=master

pkg install -y expect wget qemu-utils qemu-common qemu-system-x86_64-headless openssh

mkdir -p alpine && cd alpine

if [ ! -f "config.env" ]; then
    wget -q -c -t0 ${URL}/${BRANCH}/config.env
fi
. config.env

wget -q -c -t0 ${URL}/${BRANCH}/answerfile
wget -q -c -t0 ${URL}/${BRANCH}/ssh2qemu.sh && chmod +x ./ssh2qemu.sh
wget -q -c -t0 ${URL}/${BRANCH}/startqemu.sh && chmod +x ./startqemu.sh
wget -q -c -t0 ${URL}/${BRANCH}/installqemu.expect
expect -f installqemu.expect
