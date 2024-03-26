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
# test_version.sh
#
# Check that the current release information is proper according to the pubspec.
#

set -e
cd "`dirname \"$0\"`"

version_regex='[1-9]\.[0-9]+\.[0-9]+'

version="`cat ../pubspec.yaml | grep -Eo \"^version: *$version_regex\" | grep -oE \"$version_regex\"`"
./test_release.sh "v$version"
