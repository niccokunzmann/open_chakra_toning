#!/bin/sh
#
# This can be used after
#
#     flutter build web
#
cd "`dirname \"$0\"`"

python3 -m http.server -d build/web 8001
