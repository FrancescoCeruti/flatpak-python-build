#!/bin/sh

# Make sure we are in the same directory of this file
cd "${0%/*}"

set -xe

# Install runtime and sdk
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.freedesktop.Platform//1.6 org.freedesktop.Sdk//1.6

# Run the build
flatpak-builder --verbose --force-clean --ccache build-dir org.python.Python.json

# Put the build result in in tar.gz file
tar -zcvf build.tar.gz -C build-dir/files/ .

set +xe