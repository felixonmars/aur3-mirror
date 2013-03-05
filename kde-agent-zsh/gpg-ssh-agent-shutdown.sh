#!/bin/sh

if [ -n "$SSH_AGENT_PID" ]; then
	kill "$SSH_AGENT_PID"
	unset SSH_AGENT_PID SSH_AUTH_SOCK
fi

if [ -n "$SSH_AGENT_ENV_FILE" ]; then
	rm -f "$SSH_AGENT_ENV_FILE"
	unset SSH_AGENT_ENV_FILE
fi

if [ -n "$GPG_AGENT_INFO" ]; then
	GPG_AGENT_PID=`echo "$GPG_AGENT_INFO" | cut -d: -f2` && kill "$GPG_AGENT_PID" ||:
	unset GPG_AGENT_INFO GPG_TTY
fi

if [ -n "$GPG_AGENT_ENV_FILE" ]; then
	rm -f "$GPG_AGENT_ENV_FILE"
	unset GPG_AGENT_ENV_FILE
fi
