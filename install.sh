#!/bin/bash
set -e

echo "Create ~/.irssi_notifier/ directory"
[ -d ~/.irssi_notifier/ ] || mkdir ~/.irssi_notifier/

echo "Installing script to: ~/.irssi/scripts/"
[ -d ~/.irssi/scripts/ ] || mkdir ~/.irssi/scripts
cp irssi_notifier.pl ~/.irssi/scripts/

echo "Make script start when irssi is loaded."
[ -d ~/.irssi/scripts/autorun/ ] || mkdir ~/.irssi/scripts/autorun/
[ -f ~/.irssi/scripts/autorun/irssi_notifier.pl ] || ln -s ~/.irssi/scripts/irssi_notifier.pl ~/.irssi/scripts/autorun/

echo "Install python script that monitors for notifications."
cp irssi_notifier /usr/bin/
