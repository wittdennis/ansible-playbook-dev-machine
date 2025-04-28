#!/bin/bash

PLATFORM="undefined"
case "$OSTYPE" in
solaris*) PLATFORM=solaris ;;
darwin*) PLATFORM=osx ;;
linux*) PLATFORM=linux ;;
bsd*) PLATFORM=bsd ;;
msys*) PLATFORM=windows ;;
cygwin*) PLATFORM=windows ;;
*) PLATFORM=undefined ;;
esac

BASEPATH=/usr/bin
if [ $PLATFORM = 'osx' ]; then
    BASEPATH=/opt/homebrew/bin
elif [ $PLATFORM = 'linux' ]; then
    if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
        BASEPATH=/home/linuxbrew/.linuxbrew/bin
    fi
else
    BASEPATH=/usr/bin
fi

${BASEPATH}/ansible-galaxy install -r requirements.yml
${BASEPATH}/ansible-playbook -i inventory main.yml -K $@
