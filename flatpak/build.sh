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
# Build the flatpack.
#

builddir="../build/flatpack"
id="eu.quelltext.open_chakra_toning"
manifest="$id.yml"
repo="repo"
reponame="open_chakra_toning_repo"

cd "`dirname \"$0\"`"

## Uninstall the currently installed application
flatpak uninstall -y eu.quelltext.open_chakra_toning

flatpak-builder --force-clean "$builddir" "$manifest"
## The following commands installs the app directly
#flatpak-builder --user --install --force-clean "$builddir" "$manifest"

## The Following commands install the app through a repository
flatpak-builder --repo=repo --force-clean "$builddir" "$manifest"
flatpak --user remote-add --no-gpg-verify "$reponame" "$repo"
flatpak --user install -y "$reponame" "$id"

## Linter
## see https://docs.flathub.org/docs/for-app-authors/submission/#before-submission

flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest "$manifest"
flatpak run --command=flatpak-builder-lint org.flatpak.Builder "$repo" "$repo"

echo "You can now run the app:"
echo
echo "flatpak run $id"
