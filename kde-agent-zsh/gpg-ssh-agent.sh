#!/usr/bin/env bash

zshEnv=$(/usr/bin/env zsh -ic env)
for varName in SSH_AUTH_SOCK SSH_AGENT_PID GPG_AGENT_INFO GPG_TTY GPG_AGENT_ENV_FILE SSH_AGENT_ENV_FILE; do
	if echo "$zshEnv" | grep "^$varName=" &> /dev/null; then
		eval export $(echo "$zshEnv" | grep "^$varName=")
	fi
done
