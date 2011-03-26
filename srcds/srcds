#!/bin/sh

#If user requested help
#############################################################################
if [ "$*" = "-help" ] || [ "$*" = "--help" ] || [ "$*" = "-h" ]
then
	echo ""
	echo "The Source Dedicated Server 1.0.0"
	echo ""
	echo "A tool that runs the dedicated server component of a Source game without the client component."
	echo ""
	echo "Usage: srcds [options]"
	echo ""
	echo " Where options include:"
	echo "   -steam: Use this (along with -console) when you are running the version of SRCDS downloaded through Steam."
	echo "   -autoupdate: The server is searching for updates on startup (Linux/Unix only)."
	echo "   -console: SrcDS will run in console mode (Windows only)."
	echo "   -dev: Show developer messages."
	echo "   -debug: Debug Mode."
	echo "   -game <game or path>: Specifies which game/mod to run. Accepts either a path to a gameinfo.txt, or one of these pre-set values."
	echo "   -insecure: Will start the server without Valve Anti-Cheat."
	echo "   -nobots: Disable bots."
	echo "   -nohltv: Disables SourceTV and closes its port (usually 27020)."
	echo "   -norestart: Won't attempt to restart failed servers."
	echo "   -ip: Specifies the address to use for the bind(2) syscall, which controls on which IP addresses the program is reachable on. It must either be a local address (an addresses of the host it runs on) or 0.0.0.0 (the wildcard). This has nothing to do with externally-visible addresses in NAT setups."
	echo "   -port: The port the server advertises to clients."
	echo "   -maxplayers <number>: Specifies how many player slots the server can contain."
	echo "   -timeout <number>: Sleep for <number> seconds before restarting a failed server."
	echo "   -tickrate <number>: Specifies Server-Tickrate (for more info see Source Multiplayer Networking)."
	echo "   -verify_all: Will check that each file in the install matches the latest Steam version."
	echo "   +<console variable> <arg>: Sets the Cvar (or console variable) to the specified setting."
	echo "   +hostname 'Server Name': Specifies the name of the server."
	echo "   +ip: Specifies the IP when multiple network cards are installed (Old, but still works)."
	echo "   +map <map>: Specifies which map to start."
	echo "   +maxplayers <number>: Specifies how many player slots the server can contain (Old, but still works)."
	echo "   +hostport <port>: Specifies the host port (Port specification before -port was added, but can still be used)."
	echo "   +clientport <port>: Specifies the client port (The port the server advertises to clients, the same as -port and clientport in console)"
	echo "   +sv_lan <0/1>: If set to 1, server is only available in Local Area Network (LAN)."
	echo ""
	exit 0
fi

#If user requested version
#############################################################################
if [ "$*" = "-version" ] || [ "$*" = "--version" ] || [ "$*" = "-v" ]
then
	echo ""
	echo "The Source Dedicated Server 1.0.0"
	echo ""
	exit 0
fi


#Is orangebox installed
#############################################################################
if [ ! -f /opt/srcds/orangebox/srcds_run ]
then
	echo "You don't have installed orangebox!"
	echo ""
	echo "Aborted."
	exit 0
fi

#Start server
#############################################################################
temp=$@
if [ -z "$temp" ]
then
	echo "No attributes given."
	echo ""
	echo "Aborted."
else
	cd /opt/srcds/orangebox/
	if [ "$(id -u)" != "0" ]
	then
		sudo ./srcds_run "$@"
	else
		./srcds_run "$@"
	fi
fi
