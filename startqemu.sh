qemu-system-x86_64 \
	-machine q35 -m 1024 -smp cpus=2 -cpu qemu64 \
	-drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
  -netdev user,id=n1,hostfwd=tcp::2222-:22,hostfwd=tcp::8123-:8123,hostfwd=tcp::9000-:9000 \
  -device virtio-net,netdev=n1 \
  -fsdev local,security_model=mapped-file,id=fsdev0,multidevs=remap,path=/storage/emulated/0 \
	-device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_storage,id=virtio-9p-pci0 \
  -nographic alpine.img
echo "You can mount your sd running in guest OS this command:"
echo "mkdir /mnt/sdhost && mount -t 9p -o trans=virtio,version=9p2000.L,msize=65536 host_storage /mnt/sdhost"             