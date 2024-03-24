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
builder="flatpak run org.flatpak.Builder"

cd "`dirname \"$0\"`"

## Install the build environment
flatpak install -y org.flatpak.Builder

## Uninstall the currently installed application
flatpak uninstall -y eu.quelltext.open_chakra_toning

$builder --force-clean "$builddir" "$manifest"
## (1) The following commands installs the app directly
#flatpak-builder --user --install --force-clean "$builddir" "$manifest"

## (2) The following commands install the app according to the submission section
## see https://docs.flathub.org/docs/for-app-authors/submission#before-submission
flatpak run org.flatpak.Builder --force-clean --user --install --ccache --mirror-screenshots-url=https://dl.flathub.org/media/ --repo="$repo" "$builddir" "$manifest"

## (3) The Following commands install the app through a repository
#$builder --repo=repo --force-clean "$builddir" "$manifest"
#flatpak remote-delete --force "$reponame"
#flatpak --user remote-add --no-gpg-verify "$reponame" "$repo"
#flatpak --user install -y "$reponame" "$id"

## Linter
## see https://docs.flathub.org/docs/for-app-authors/submission/#before-submission

flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest "$manifest"
flatpak run --command=flatpak-builder-lint org.flatpak.Builder "$repo" "$repo"

## flatpak file
flatpak build-bundle repo "../build/$id.flatpak" "$id"

echo "You can now run the app:"
echo
echo "flatpak run $id"
