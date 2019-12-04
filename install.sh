#!/bin/bash
set -e

export INSTALL_DIR=$HOME
export VERSION=v0.15.0.1
export FILENAME=monero-gui-linux-x64-${VERSION}.tar.bz2
export REPO_DIR=$(pwd)

echo "Fetching Monero GUI $VERSION"

cd $INSTALL_DIR

curl -L --retry 5 https://downloads.getmonero.org/gui/linux64 > $FILENAME

echo "Extracting the archive"

tar xvjf $FILENAME

echo "Creating Desktop Shortcut"

cat <<EOF >> monero.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Monero
GenericName=Monero
Icon=${INSTALL_DIR}/monero-gui-${VERSION}/xmr.png
Comment=Manage your Monero
Exec=${INSTALL_DIR}/monero-gui-${VERSION}/monero-wallet-gui %U
Terminal=false
StartupNotify=true
EOF

echo "Install Desktop Icon"
cp $REPO_DIR/xmr.png ${INSTALL_DIR}/monero-gui-${VERSION}/

echo "Install Desktop Shortcut"
sudo cp monero.desktop /usr/share/applications/
rm monero.desktop

echo "Removing downloaded archive"
rm $FILENAME

echo "Done"
