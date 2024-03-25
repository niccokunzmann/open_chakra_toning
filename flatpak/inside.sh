#!/bin/sh
# Open Chakra Toning
# Copyright (C) 2024  Nicco Kunzmann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

##
## Run inside the flatpak build and move all files to their locations.
##

set -e
cd "`dirname \"$0\"`"

echo Install the executable 

mkdir -p /app/bin/
install -D open_chakra_toning.sh /app/bin/open_chakra_toning
cp -r . /app/Open-Chakra-Toning

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
  cp icon/icon-$resolution.png "$dir/eu.quelltext.open_chakra_toning.png"
done
mkdir -p /app/share/icons/hicolor/scalable/apps/
cp icon/icon.svg /app/share/icons/hicolor/scalable/apps/eu.quelltext.open_chakra_toning.svg


echo Install done
