#!/bin/bash

iso_url="https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso"

vm_name="arch-vm"
vm_ram="4096" 
vm_disk_size="40" 

cd ~/Downloads

# Downloading Arch Linux
if [[ ! -f archlinux.iso ]]; then
    echo "Downloading Arch Linux..."
    wget -N "$iso_url" -O archlinux.iso
fi

# Creating QEMU VM
echo "Creating VM..."

if [[ ! -d ~/shared ]]; then mkdir ~/shared; fi

# remove sudo to create machine in `qemu:///session` instead of `qemu:///system`
virt-install \
  --connect=qemu:///session \
  --name "$vm_name" \
  --ram "$vm_ram" \
  --disk size="$vm_disk_size",pool=default,bus=virtio,format=qcow2,sparse=yes \
  --cdrom archlinux.iso \
  --virt-type=kvm \
  --vcpus 4 \
  --boot uefi \
  --os-variant archlinux \
  --network bridge=virbr0 \
  --graphics spice,listen=127.0.0.1 \
  --sound ich9 \
  --filesystem source=~/shared,target=shared,accessmode=mapped \
  --noautoconsole

  # --graphics none \
  # --graphics vnc\
  # --graphics spice,listen=127.0.0.1 \
  # --network default \
  # --disk path="$DISK_DIRECTORY/archlinux-alis.qcow2,format=qcow2,size=40,sparse=yes" \


sleep 10

echo "Witing 40s for starting VM..."

sleep 40

echo "Sending keys 'curl -sL https://t.ly/gedVj | bash'..."


#  curl -sL https://t.ly/gedVj | bash
# "curl -sL "
virsh send-key $vm_name KEY_C
virsh send-key $vm_name KEY_U
virsh send-key $vm_name KEY_R
virsh send-key $vm_name KEY_L
virsh send-key $vm_name KEY_SPACE
virsh send-key $vm_name KEY_MINUS
virsh send-key $vm_name KEY_S
virsh send-key $vm_name KEY_LEFTSHIFT KEY_L
virsh send-key $vm_name KEY_SPACE
# "https://t.ly/gedVj"
virsh send-key $vm_name KEY_H
virsh send-key $vm_name KEY_T
virsh send-key $vm_name KEY_T
virsh send-key $vm_name KEY_P
virsh send-key $vm_name KEY_S
virsh send-key $vm_name KEY_LEFTSHIFT KEY_SEMICOLON
virsh send-key $vm_name KEY_SLASH
virsh send-key $vm_name KEY_SLASH
virsh send-key $vm_name KEY_T
virsh send-key $vm_name KEY_DOT
virsh send-key $vm_name KEY_L
virsh send-key $vm_name KEY_Y
virsh send-key $vm_name KEY_SLASH
virsh send-key $vm_name KEY_G
virsh send-key $vm_name KEY_E
virsh send-key $vm_name KEY_D
virsh send-key $vm_name KEY_LEFTSHIFT KEY_V
virsh send-key $vm_name KEY_J
# " | bash"
virsh send-key $vm_name KEY_SPACE
virsh send-key $vm_name KEY_LEFTSHIFT KEY_BACKSLASH
virsh send-key $vm_name KEY_SPACE
virsh send-key $vm_name KEY_B
virsh send-key $vm_name KEY_A
virsh send-key $vm_name KEY_S
virsh send-key $vm_name KEY_H
virsh send-key $vm_name KEY_ENTER

sleep 5

echo "Sending keys './alis.sh'..."

# ./alis.sh
virsh send-key $vm_name KEY_DOT
virsh send-key $vm_name KEY_SLASH
virsh send-key $vm_name KEY_A
virsh send-key $vm_name KEY_L
virsh send-key $vm_name KEY_I
virsh send-key $vm_name KEY_S
virsh send-key $vm_name KEY_DOT
virsh send-key $vm_name KEY_S
virsh send-key $vm_name KEY_H
virsh send-key $vm_name KEY_ENTER

sleep 3

echo "Sending keys 'y'..."

# continue? Y
virsh send-key $vm_name KEY_Y
virsh send-key $vm_name KEY_ENTER

sleep 3

echo "Sending keys '111'..."

# root password: 111
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_ENTER
sleep 1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_ENTER

sleep 2

echo "Sending keys '111'..."

# user password: 111
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_ENTER
sleep 1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_1
virsh send-key $vm_name KEY_ENTER