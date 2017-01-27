% lessfilter
% Eddie Antonio Santos

NAME
====

**lessfilter** – automatically formats Markdown pages for less(1)

SYNOPSIS
========

| lessfilter *filename.md*

DESCRIPTION
===========

A filter for BSD **less(1)** to be installed by setting the environment
variable:

    export LESSOPEN="|$(which lessfilter) %s"

COPYING
=======

2017 (c) Eddie Antonio Santos. Released under the Apache 2.0 license.
