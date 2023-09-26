#!/usr/bin/env bash
# begin ~/.config/bash.d/functions.bash

if [ ! "$(type pathremove >/dev/null 2>&1)" ] ; then
    pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
            if [ "${DIR}" != "${1}" ] ; then
                NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
            fi
        done
        export "$PATHVARIABLE"="${NEWPATH}"
    }
    export -f pathremove
fi

if [ ! "$(type pathprepend >/dev/null 2>&1)" ] ; then
    pathprepend () {
        pathremove "${1}" "${2}"
        local PATHVARIABLE=${2:-PATH}
        export "$PATHVARIABLE"="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
    }
    export -f pathprepend
fi

if [ ! "$(type pathappend >/dev/null 2>&1)" ] ; then
    pathappend () {
        pathremove "${1}" "${2}"
        local PATHVARIABLE=${2:-PATH}
        export "$PATHVARIABLE"="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
    }
    export -f pathappend
fi

if [ -e ~/.config/bash.d/99-poetry.bash ]; then
    source ~/.config/bash.d/99-poetry.bash
fi
# end ~/.config/bash.d/functions.bash
