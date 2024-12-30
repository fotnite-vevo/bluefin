#!/usr/bin/env bash
set -oue pipefail

# Install surface repo
dnf5 config-manager addrepo --from-repofile=https://pkg.surfacelinux.com/fedora/linux-surface.repo

# Add surface kernel
dnf5 -y remove kernel*
dnf5 -y install --allowerasing kernel-surface iptsd libwacom-surface
