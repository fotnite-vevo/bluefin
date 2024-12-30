#!/usr/bin/env bash
set -oue pipefail

test -f /usr/bin/systemctl && echo "systemctl exists"
test -f /usr/bin/systemctl.backup && echo "systemctl.backup exists"

# Install surface repo
dnf5 config-manager addrepo --from-repofile=https://pkg.surfacelinux.com/fedora/linux-surface.repo

test -f /usr/bin/systemctl && echo "systemctl exists"
test -f /usr/bin/systemctl.backup && echo "systemctl.backup exists"

# Add surface kernel
dnf5 -y install --allowerasing kernel-surface kernel-surface-devel libwacom-surface iptsd
test -f /usr/bin/systemctl && echo "systemctl exists"
test -f /usr/bin/systemctl.backup && echo "systemctl.backup exists"
dnf5 -y remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra
