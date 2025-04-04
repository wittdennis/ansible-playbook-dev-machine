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

BASEPATH=/usr/local/bin
if [ $PLATFORM = 'osx' ]; then
    BASEPATH=/opt/homebrew/bin
elif [ $PLATFORM = 'linux' ]; then
    BASEPATH=/home/linuxbrew/.linuxbrew/bin
else
    BASEPATH=/usr/local/bin
fi

${BASEPATH}/ansible-galaxy install -r requirements.yml
${BASEPATH}/ansible-playbook -i inventory main.yml -K $@
