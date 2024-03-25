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

#
# Generate the yml file that can be used to build the flatpak.
#

set -e
cd "`dirname \"$0\"`"

HASH="$1"
URL="$2"

if [ -z "$HASH" ] ||  [ -z "$URL" ]; then
  echo "$0 SHA256SUM URL"
  echo
  echo " SHA256SUM - the hash of the URL"
  echo " SHA256SUM - the URL"
  exit
fi

cat "eu.quelltext.open_chakra_toning.yml" | \
    sed "s/- type: dir/- type: archive/g" | \
    sed -r "s|( +)path: Open-Chakra-Toning|\\1url: $URL\n\\1sha256: $HASH|g"