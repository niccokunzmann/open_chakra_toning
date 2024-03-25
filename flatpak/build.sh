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

builddir="../build/flatpak"
id="eu.quelltext.open_chakra_toning"
manifest="$id.yml"
repo="repo"
reponame="open_chakra_toning_repo"
builder="flatpak run org.flatpak.Builder"

set -e
cd "`dirname \"$0\"`"

echo "Install the build environment"
## see https://docs.flatpak.org/en/latest/first-build.html
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.flatpak.Builder
flatpak install -y flathub org.freedesktop.Platform//23.08
flatpak install -y flathub org.freedesktop.Sdk//23.08

echo "Uninstall the currently installed application"
flatpak uninstall -y eu.quelltext.open_chakra_toning || true

$builder --force-clean "$builddir" "$manifest"
echo "(1) The following commands installs the app directly"
#flatpak-builder --user --install --force-clean "$builddir" "$manifest"

echo "(2) The following commands install the app according to the submission section"
## see https://docs.flathub.org/docs/for-app-authors/submission#before-submission
$builder --force-clean --user --install --ccache --repo="$repo" --mirror-screenshots-url=https://dl.flathub.org/media/ "$builddir" "$manifest"

echo "(3) The Following commands install the app through a repository"
#$builder --repo="$repo" --force-clean "$builddir" "$manifest"
#flatpak remote-delete --force "$reponame"
#flatpak --user remote-add --no-gpg-verify "$reponame" "$repo"
#flatpak --user install -y "$reponame" "$id"

echo "Linter"
## see https://docs.flathub.org/docs/for-app-authors/submission/#before-submission

flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest "$manifest"
flatpak run --command=flatpak-builder-lint org.flatpak.Builder "$repo" "$repo"

## flatpak file
flatpak build-bundle "$repo" "../build/$id.flatpak" "$id"

echo "You can now run the app:"
echo
echo "flatpak run $id"
