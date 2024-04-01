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
# Generate the xml file that can be used to build the flatpak.
#


set -e
cd "`dirname \"$0\"`"
(
    out() {
        echo ' -->'
        echo "$@"
        echo -n '  <!-- '
    }
    lang="default"
    xml_lang() {
        if [ "$lang" != "default" ]; then
            echo "xml:lang='$lang'"
        fi
    }
    localize_description() {
        local file="$1"
        markdown_py "$file" | sed 's/^/        /g' | sed 's|<li>|<li '"`xml_lang`"'>|g' | sed 's|<p>|<p '"`xml_lang`"'>|g'
    }
    #
    # generate the first output
    #
    cat ./eu.quelltext.open_chakra_toning.metainfo.xml | grep -vF '</component>' | grep -vF '<summary>' | grep -vF '<name>'
    #
    # Start safe mode
    #
    echo -n '  <!-- '
    languages="`ls ../metadata/ | tac | grep -vF default` default"


    #
    # Check dependencies
    #
    if ! which markdown_py 1> /dev/null; then
        echo "Install mardown_py!"
        echo "pip3 install --user markdown"
        exit 1
    fi

    #
    # Generate title
    #
    out
    for lang in $languages; do
        file="../metadata/$lang/title.txt"
        if [ -f "$file" ]; then
            out "  <name `xml_lang`>`cat \"$file\"`</name>"
        fi
    done

    #
    # Generate summary
    #
    out
    for lang in $languages; do
        file="../metadata/$lang/short_description.txt"
        if [ -f "$file" ]; then
            out "  <summary `xml_lang`>`cat \"$file\"`</summary>"
        fi
    done

    #
    # Generate description
    #
    #   <description>
    #     <p>
    #       Open your chakras with your voice. Choose between the different chakras and their frequencies. Meditate with guidance.
    #     </p>
    #   </description>
    out
    out "  <description>"
    for lang in $languages; do
        file="../metadata/$lang/full_description.txt"
        if [ -f "$file" ]; then
            out "`localize_description \"$file\"`"
        fi
    done
    out "  </description>"

    #
    # Get all the tags
    #
    git fetch --tags || true
    tags="`git tag | grep -E '^v' | sort -Vr`"

    #
    # generate release for each tag
    #
    #   <releases>
    #     <release version="1.0.0" date="2024-03-24">
    #       <url type="details">https://github.com/niccokunzmann/open_chakra_toning/blob/main/README.md#changelog</url>
    #       <description>
    #         <p>First version</p>
    #         <ul>
    #           <li>tones for chakras</li>
    #         </ul>
    #       </description>
    #     </release>
    #   </releases>
    out '  <releases>'
    for tag in $tags; do
        versionCode="`echo $tag | grep -oE '[0-9]+$'`"
        echo "versionCode=$versionCode"
        out "    <release version='`echo $tag | tail -c+2`' date='`git log --pretty='%as' -1 \"$tag\"`'>"
        out "      <url type='details'>https://github.com/niccokunzmann/open_chakra_toning/releases/tag/$tag</url>"
        default=../metadata/en/changelogs/$versionCode.txt
        if ! [ -f "$default" ]; then
            echo "Changelog not found! Expected: `pwd`/$default to be present!"
            exit 2
        fi
        out "      <description>"
        for lang in $languages; do
            file="../metadata/$lang/changelogs/$versionCode.txt"
            if [ -f "$file" ]; then
                out "`localize_description \"$file\"`"
            fi
        done
        out "      </description>"
        out "    </release>"
    done

    out '  </releases>'

    #
    # Exit safe mode
    #
    echo '  -->'
    echo '</component>'
) | grep -vE '<!-- *-->'