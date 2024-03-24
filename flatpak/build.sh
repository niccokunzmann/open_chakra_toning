#!/bin/sh
#
# Build the flatpack.
#

builddir="../build/flatpack"
manifest="eu.quelltext.open_chakra_toning.yml"

cd "`dirname \"$0\"`"

flatpak-builder --force-clean "$builddir" "$manifest"
flatpak-builder --user --install --force-clean "$builddir" "$manifest"

echo "You can now run the app:"
echo "  flatpak run eu.quelltext.open_chakra_toning"
