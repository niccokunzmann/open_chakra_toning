#!/bin/sh
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
