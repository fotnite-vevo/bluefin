#!/usr/bin/env bash
set -oue pipefail

# Install surface repo
dnf5 config-manager addrepo --from-repofile=https://pkg.surfacelinux.com/fedora/linux-surface.repo

# Add surface kernel
dnf5 -y remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra
rpm-ostree install kernel-surface kernel-surface-devel surface-secureboot
