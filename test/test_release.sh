#!/bin/bash
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
# test_release.sh TAG
#
# Check that the current release information is proper according to the tag.
#

cd "`dirname \"$0\"`"

#
# Initial check
#

tag="$1"
version_regex='[1-9]\.[0-9]+\.[0-9]+'

if ! echo "$tag" | grep -qE "v$version_regex"; then
  echo "Invalid tag name \"$tag\". We need \"vX.Y.Z\"."
  exit 1
fi
version="`echo $tag | grep -Eo \"$version_regex\"`"
echo "version: $version"

#
# Start checks and summaries.
#
EXIT=0
# colors, see https://stackoverflow.com/a/5947802/1320237
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
check() {
    code="$?"
    echo -n "$@ "
    if [ "$code" == "0" ]; then
      echo -e "${GREEN}OK${NC}"
    else
      echo -e "${RED}FAIL${NC}"
      EXIT=1
    fi
}

#
# msix_version: 1.0.1.0
#
cat ../pubspec.yaml | grep -q "msix_version: $version"
check "pubspec.yaml: Set msix_config.msix_version to \"$version.0\"."

#
# version: 1.0.1+1
#
last="`echo \"$version\" | grep -Eo '[0-9]+$'`"
cat ../pubspec.yaml | grep -qF "version: $version+$last"
check "pubspec.yaml: Set version to \"$version+$last\"."

#
# Set the exist status
#
echo "exit $EXIT"
exit "$EXIT"
