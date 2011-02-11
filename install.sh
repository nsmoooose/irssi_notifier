#!/bin/bash
set -e

echo "Installing script to: ~/.irssi/scripts/"
[ -d ~/.irssi/scripts/ ] || mkdir -p ~/.irssi/scripts
cp irssi_notifier.pl ~/.irssi/scripts/

echo "Make script start when irssi is loaded."
[ -d ~/.irssi/scripts/autorun/ ] || mkdir ~/.irssi/scripts/autorun/
[ -f ~/.irssi/scripts/autorun/irssi_notifier.pl ] || ln -s ~/.irssi/scripts/irssi_notifier.pl ~/.irssi/scripts/autorun/

echo "Install python script that monitors for notifications."
cp irssi_notifier_client /usr/bin/
cp irssi_notifier_server /usr/bin/
