#!/usr/bin/env zsh

setopt ERR_EXIT
setopt NO_UNSET

repo=$0:A:h:h

function clean()
{
    rm --force --recursive --verbose $@
}

clean $repo/example/.meteor/local
clean $repo/fds:jison-base/.build*
clean $repo/fds:jison-build/.build*
clean $repo/fds:jison-build/.npm/plugin/jison/node_modules

