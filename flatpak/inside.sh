#!/bin/sh
##
## Run inside the flatpak build and move all files to their locations.
##

set -e
cd "`dirname \"$0\"`"

echo Install the executable 

install -D open_chakra_toning.sh /app/bin/open_chakra_toning
mv ../build/linux/x64/release/bundle /app/bundle

echo Install metadata
## see https://docs.flatpak.org/en/latest/conventions.html#metainfo-files 
## see https://docs.flathub.org/docs/for-app-authors/metainfo-guidelines/#path-and-filename

mkdir -p files/share/app-info
cp eu.quelltext.open_chakra_toning.metainfo.xml files/share/app-info/
mkdir -p /app/share/metainfo/
cp eu.quelltext.open_chakra_toning.metainfo.xml /app/share/metainfo/

echo Install Desktop file
## see https://docs.flatpak.org/en/latest/conventions.html#desktop-files

mkdir -p /app/share/applications/
cp eu.quelltext.open_chakra_toning.desktop /app/share/applications/eu.quelltext.open_chakra_toning.desktop

echo Install icons
## see https://docs.flatpak.org/en/latest/conventions.html#application-icons

for resolution in 128 256 512; do
  dir="/app/share/icons/hicolor/${resolution}x${resolution}/apps/"
  mkdir -p "$dir"
  cp ../assets/img/icon/icon-$resolution.png "$dir/eu.quelltext.open_chakra_toning.png"
done
mkdir -p /app/share/icons/hicolor/scalable/apps/
cp ../assets/img/icon/icon.svg /app/share/icons/hicolor/scalable/apps/eu.quelltext.open_chakra_toning.svg


echo Install done
