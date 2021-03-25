#!/usr/bin/env bash
# Begin ~/.bash_profile
# Personal environment variables and startup programs.
# <alexforsale@yahoo.com>

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

[[ -f /etc/profile ]]         && source /etc/profile

# in the actual startup sequences, "~/.bash_profile" is invoked
# before "~/.profile" so we need to source "~/.profile" first.

[[ -f ${HOME}/.profile ]]       && source "${HOME}"/.profile
[[ -f ${HOME}/.bashrc ]]        && source "${HOME}"/.bashrc

# local bash_profile
# ${BASH_DIR} should already set by now
[[ -f ${BASH_DIR}/bash_profile.local ]] && source "${BASH_DIR}"/bash_profile.local

# End ~/.bash_profile
