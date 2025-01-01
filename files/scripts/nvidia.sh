#!/usr/bin/env bash
set -oue pipefail

# Install nvidia repo
dnf5 config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-nvidia.repo

# Build nvidia kmod
dnf5 -y install akmod-nvidia
akmods --force
dnf5 -y history undo last

# Install nvidia drivers
rpm-ostree install /usr/src/akmods/nvidia-kmod.latest nvidia-driver nvidia-driver-cuda

# Disable nvidia repo
dn5 config-manager setopt fedora-nvidia.enabled=0

# Disable nouveau and enable nvidia-drm
#rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1
