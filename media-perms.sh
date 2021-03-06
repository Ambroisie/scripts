#!/bin/sh

DIR_PERM="0775"
FILE_PERM="0664"

chgrp media -R "$1"

find "$1" -type d -exec chmod "$DIR_PERM" {} +
find "$1" -type f -exec chmod "$FILE_PERM" {} +
