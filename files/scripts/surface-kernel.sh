#!/usr/bin/env bash
set -oue pipefail

# Install surface repo
curl -Lo /etc/yum.repos.d/linux-surface.repo \
  https://pkg.surfacelinux.com/fedora/linux-surface.repo

# Remove kmods
rpm-ostree override remove $(rpm -qa | grep kmod | sed "1,2d")

# Add surface kernel
rpm-ostree override replace --experimental --from repo='linux-surface' \
  kernel-surface \
  kernel-surface-core \
  kernel-surface-modules \
  kernel-surface-modules-core \
  kernel-surface-modules-extra \
  kernel-surface-devel
