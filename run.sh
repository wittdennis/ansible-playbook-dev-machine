#!/bin/sh

/opt/homebrew/bin/ansible-galaxy install -r requirements.yml
/opt/homebrew/bin/ansible-playbook -i inventory main.yml -K $@
