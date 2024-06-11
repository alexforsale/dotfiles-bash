#!/usr/bin/env bash
mkdir -pv ./content
ln -svf ../index.org ./content/index.org
emacs -Q --script build.el
