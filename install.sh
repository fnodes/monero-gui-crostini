#!/bin/bash
set -e

export INSTALL_DIR=$HOME
export VERSION=v0.13.0.4
export FILENAME=monero-gui-linux-x64-${VERSION}.tar.bz2

echo "Fetching Monero GUI $VERSION"

cd $INSTALL_DIR

curl -L https://github.com/monero-project/monero-gui/releases/download/${VERSION}/${FILENAME} > $FILENAME

echo "Extracting the archive"

tar xvjf $FILENAME

echo "Creating Desktop Shortcut"

cat <<EOF >> monero.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Monero Graphical Wallet
GenericName=Monero Graphical Wallet
Comment=Manage your Monero
Exec=${INSTALL_DIR}/monero-gui-${VERSION}/start-gui.sh %U
Terminal=false
StartupNotify=true
EOF

echo "Install Desktop Shortcut"
sudo cp monero.desktop /usr/share/applications/

echo "Done"
