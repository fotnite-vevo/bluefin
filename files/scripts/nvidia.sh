#!/usr/bin/env bash
set -oue pipefail

# Install nvidia repo
dnf5 config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-nvidia.repo

# Install nvidia drivers
dnf5 -y install nvidia-driver akmod-nvidia

# Disable nouveau and enable nvidia-drm
rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1
