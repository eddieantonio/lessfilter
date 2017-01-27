#!/bin/sh

# Copyright 2017 Eddie Antonio Santos <easantos@ualberta.ca>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# LESSOPEN filter for BSD less(1).
#
# Usage:
#
# Set as the LESSOPEN environment variable.
#
# e.g.., install this as:
#
#   /usr/local/bin/lessfilter
#
# Then export the LESSOPEN environment variable as such:
#
#   export LESSOPEN='|/usr/local/bin/lessfilter %s'
#

case "$1" in
  # Format markdown with Pandoc.
  *.md)
    date=$(stat -f '%Sm' -t '%+'  "$1")
    pandoc --standalone --from markdown --to man -Vtitle="$(basename "$1")" \
      -Vheader="Markdown Document" -Vdate="$date" "$1" \
      | groff -Wall -mtty-char -Tutf8 -mandoc
    ;;
  *)
    exit 1
esac

###
# Appendix

# How man(1) works on my OS X system:
#
# sh -c (
#  cd '/usr/share/man' && (
#    echo ".ll 11.4i";
#    echo ".nr LL 11.4i";
#    /bin/cat $FILENAME
#  ) | /usr/bin/tbl
#    | /usr/bin/groff -Wall -mtty-char -Tascii -mandoc -c
#    | (less || true))

#
# .ll sets the [l]ine [l]ayout
#   https://www.gnu.org/software/groff/manual/html_node/Line-Layout.html#index-_002ell
#
# .nr sets a register
#   https://www.gnu.org/software/groff/manual/html_node/Setting-Registers.html#index-nr

# See
#   man 1 less
# And search for
#   /^INPUT PREPROCESSOR
# for more information
