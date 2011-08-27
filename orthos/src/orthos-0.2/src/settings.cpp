
#include "settings.h"

#include <stdlib.h>
#include <ctype.h>

#include <string>
#include <iostream>
#include <fstream>
#include <map>
using namespace std;


#define DEFAULT_CONFIG "/etc/orthos.conf"

static map<string,string> config;

static int load_defaults()
{
	config["autologin"]="no";
	config["display"]=":0";
	config["Xserver"]="/usr/bin/X";
	config["server_args"]="";
	config["Xauth"]="/usr/bin/xauth";
	config["server_auth"]="/var/run/orthos.auth";
	config["default_path"]="/usr/local/bin:/usr/bin:/bin";
	config["sessions"]=
		"failsafe:/usr/bin/xterm";
	config["skin"]="/etc/orthos.skin";

	return 0;
}

static bool is_conf_true(string str) //ok we copy arguments, and wut.
{
	for(unsigned int i=0;i<str.length();++i)str[i]=tolower(str[i]);
	if(str=="true")return true;
	if(str=="yes")return true;
	if(str=="1")return true;
	return false;
}

int load_config (int argc, char**argv)
{
	free_config();
	load_defaults();

	const char*file=DEFAULT_CONFIG;
	if(argc>1)file=argv[1];

	string t;
	int i;

	ifstream f;
	f.open(file);

	while(f.good()) {
		getline(f,t);
		i=t.find('\t');
		if(i<=0)continue;
		config[t.substr(0,i)]=t.substr(i+1,t.length()-i-1);
	}
	f.close();

	return 0;
}

int free_config()
{
	config=map<string,string>();

	return 0;
}

const char* get_setting(const char* name)
{
	map<string,string>::iterator i = config.find(name);
	if(i!=config.end()) return i->second.c_str();
	return 0;
}

int get_int_setting(const char* name)
{
	map<string,string>::iterator i = config.find(name);
	if(i!=config.end()) return atoi(i->second.c_str());
	return 0;
}
	
bool get_bool_setting(const char* name)
{
	map<string,string>::iterator i = config.find(name);
	if(i!=config.end()) return is_conf_true(i->second.c_str());
	return false;
}
	
