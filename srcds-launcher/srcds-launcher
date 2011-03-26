#!/bin/sh

#Default launch options. Edit here: /opt/srcds/orangebox_server_launcher_config
#############################################################################
def_game="cstrike" #Specifies which game to start.
def_ip="" #Specifies the IP when multiple network cards are installed. Required for VAC2 operation.
def_port="27015" #Specifies which port to open for client connections. Default is 27015.
def_update=false #The server is searching for updates on startup.
def_tickrate="" #Specifies Server-Tickrate.
def_map="de_dust2" #Specifies which map to start.
def_maxplayers="" #Specifies how many player slots the server can contain.
def_secure=true #Enables Valve Anti-Cheat technology.

#Is orangebox installed
#############################################################################
if [ ! -f /opt/srcds/orangebox/srcds_run ]
then
	echo ""
	echo "You don't have installed orangebox!"
	echo ""
	exit 0
fi

#If user requested help
#############################################################################
if [ "$*" = "-help" ] || [ "$*" = "--help" ] || [ "$*" = "-h" ]
then
	echo ""
	echo "Srcds Launcher Version 1.0.2, by Olli Laasonen <admin at laasonen dot net>"
	echo ""
	echo "Makes starting of srcds orangebox servers easier and faster."
	echo ""
	echo "Config file:"
	echo " /opt/srcds/srcds-launcher-config"
	echo ""
	echo "Usage: srcds-launcher [options]"
	echo ""
	echo " Where options include:"
	echo "   -help:  Prints this information message."
	echo "   -version: Print programs version number."
	echo "   -game: Specifies which game to start."
	echo "   -ip: Specifies the IP when multiple network cards are installed. Required for VAC2 operation."
	echo "   -port: Specifies which port to open for client connections. Default is 27015."
	echo "   -update: The server is searching for updates on startup."
	echo "   -noupdate: Do not search for updates on startup."
	echo "   -tickrate: Specifies Server-Tickrate."
	echo "   -map: Specifies which map to start."
	echo "   -maxplayers: Specifies how many player slots the server can contain."
	echo "   -insecure: Disables Valve Anti-Cheat technology."
	echo "   -secure: Enables Valve Anti-Cheat technology."
	echo ""
	exit 0
fi

#If user requested version
#############################################################################
if [ "$*" = "-version" ] || [ "$*" = "--version" ] || [ "$*" = "-v" ]
then
	echo ""
	echo "Srcds Launcher Version 1.0.2, by Olli Laasonen <admin at laasonen dot net>"
	echo ""
	exit 0
fi

#Do we have separate config file
#############################################################################
if [ -f /opt/srcds/srcds-launcher-config ]
then
	source /opt/srcds/srcds-launcher-config
else
	echo "Warning: couldn't find config file."
fi

#Get attributes
#############################################################################
status=0 #0 = waiting for attribute, 1 = waiting for value
attribute="" #Current attribute
error=false #false = no errors, true=error

for p in $*; do
	if [ $error = false ]
	then
		if [ $status = 0 ] #New attribute
		then
			if [ $p = "-noupdate" ] #Make server update itself
			then
				update=false
				status=0
			elif [ $p = "-update" ] #Make server update itself
			then
				update=true
				status=0
			elif [ $p = "-insecure" ] #Disable vac
			then
				secure=false
				status=0
			elif [ $p = "-secure" ] #Enable vac
			then
				secure=true
				status=0
			elif [ $p = "-ip" ] #Change ip
			then
				attribute="ip"
				status=1
			elif [ $p = "-port" ] #Change port
			then
				attribute="port"
				status=1
			elif [ $p = "-maxplayers" ] #Maxium amount of players
			then
				attribute="maxplayers"
				status=1
			elif [ $p = "-map" ] #Select map
			then
				attribute="map"
				status=1
			elif [ $p = "-tickrate" ] #Select tickrate
			then
				attribute="tickrate"
				status=1
			elif [ $p = "-game" ] #Select game
			then
				attribute="game"
				status=1
			else #Unknown command
				errors[${#errors[*]}]="Unknown_attribute:_$p"
				error=true
			fi
		else #New value
			if [ $attribute = "port" ]
			then
				port="$p"
			elif [ $attribute = "ip" ]
			then
				ip="$p"
			elif [ $attribute = "maxplayers" ]
			then
				maxplayers="$p"
			elif [ $attribute = "map" ]
			then
				map="$p"
			elif [ $attribute = "tickrate" ]
			then
				tickrate="$p"
			elif [ $attribute = "game" ]
			then
				game="$p"
			fi
			status=0
			attribute=""
		fi
	fi
done;



#Add default values, if needed
#############################################################################
if [ -z "$game" ] #Game
then
	game=$def_game
fi
if [ -z "$ip" ] #Ip
then
	ip=$def_ip
fi
if [ -z "$port" ] #Port
then
	port=$def_port
fi
if [ -z "$update" ] #Update
then
	update=$def_update
fi
if [ -z "$map" ] #Map
then
	map=$def_map
fi
if [ -z "$tickrate" ] #Tickrate
then
	tickrate=$def_tickrate
fi
if [ -z "$maxplayers" ] #Maxplayers
then
	maxplayers=$def_maxplayers
fi
if [ -z "$secure" ] #Secure
then
	secure=$def_secure
fi

#Convert settings
#############################################################################
converted_game=$game

if [ ! -z "$ip" ] #Ip
then
	converted_ip="+ip $ip"
else
	converted_ip=""
fi

if [ ! -z "$port" ] #Port
then
	converted_port="+port $port"
else
	converted_port=""
fi
if [ "$update" = true ] #Update
then
	converted_update="-autoupdate"
else
	converted_update=""
fi
if [ ! -z "$map" ] #Map
then
	converted_map="+map $map"
else
	converted_map=""
fi
if [ ! -z "$tickrate" ] #Tickrate
then
	converted_tickrate="-tickrate $tickrate"
else
	converted_tickrate=""
fi
if [ ! -z "$maxplayers" ] #Maxplayers
then
	converted_maxplayers="+maxplayers $maxplayers"
else
	converted_maxplayers=""
fi
if [ "$secure" = true ] #Secure
then
	converted_secure=""
else
	converted_secure="-insecure"
fi
#Run server
#############################################################################
if [ "$error" = true ]
then
	echo " Errors found:"
	for item in ${errors[*]}
	do
    	echo "   -$item"
	done
	echo ""
	echo "Aborted."
else
	echo ""
	echo "Starting Counter-Strike: Source Server.."
	echo "----------------------------------------------------------"
	echo ""
	srcds -game $converted_game $converted_update $converted_ip $converted_tickrate $converted_port $converted_secure $converted_maxplayers $converted_map
fi
