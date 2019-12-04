#!/bin/bash
set -e

export INSTALL_DIR=$HOME
export VERSION=v0.15.0.1
export FILENAME=monero-gui-linux-x64-${VERSION}.tar.bz2

echo "Fetching Monero GUI $VERSION"

cd $INSTALL_DIR

curl -L https://downloads.getmonero.org/gui/linux64 > $FILENAME

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
Exec=env QMLSCENE_DEVICE=softwarecontext ${INSTALL_DIR}/monero-gui-${VERSION}/monero-wallet-gui %U
Terminal=false
StartupNotify=true
EOF

echo "Install Desktop Shortcut"
sudo cp monero.desktop /usr/share/applications/

echo "Removing downloaded archive"
rm $FILENAME

echo "Done"
