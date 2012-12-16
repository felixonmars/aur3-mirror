#!/bin/bash

# The affected files:
# 3bb2e88a915b3cb003ca185357a92c16  US_export_policy.jar
# 9dd69bcc7637d872121880c35437788d  local_policy.jar

# Internal variables
md5_this_uspolicy=3bb2e88a915b3cb003ca185357a92c16
md5_this_localpolicy=9dd69bcc7637d872121880c35437788d
jcedir=/usr/share/java/java-jce_ustrength7
jresecuritydir=/opt/java/jre/lib/security
_ext=java-jce_ustrength.backup

# 1 = Root
# 0 = other ID
check_root(){
	if [ ${UID} -eq 0 ]; then
		return 1
	fi
	return 0
}

# 0 = Unlimited Strength JCE Policy already installed
# 1 = Original JCE Policy installed
# 2 = Destination files don't exist
check_destinationfiles(){
	if [ ! -e "${jresecuritydir}/US_export_policy.jar" -o ! -e "${jresecuritydir}/local_policy.jar" ];
	then
		return 2
	fi
	md5_uspolicy=$(md5sum ${jresecuritydir}/US_export_policy.jar | cut -d " " -f 1)
	md5_localpolicy=$(md5sum ${jresecuritydir}/local_policy.jar | cut -d " " -f 1)
	if [ "${md5_uspolicy}" == "${md5_this_uspolicy}" -a \
	     "${md5_localpolicy}" == "${md5_this_localpolicy}" ]; then
	     return 0
        fi
	return 1
}

install(){
	check_destinationfiles
	not_installed=$?
	if [ "${not_installed}" -eq "1" ]; then
		check_root
		isroot=$?
		if [ "${isroot}" -eq "0" ]; then
			echo "You must be root for doing this operation."
			exit 1
		fi
		echo -n "Installing Unlimited Strength JCE files..."
		cp ${jresecuritydir}/US_export_policy.jar ${jresecuritydir}/US_export_policy.jar.${_ext} || return 1
		cp ${jresecuritydir}/local_policy.jar ${jresecuritydir}/local_policy.jar.${_ext} || return 1
		cp ${jcedir}/US_export_policy.jar ${jresecuritydir}/ || return 1
		cp ${jcedir}/local_policy.jar ${jresecuritydir}/ || return 1
		echo " installed."
	else 
		echo "Unlimited Strength JCE files already installed."
	fi
}

uninstall(){
	check_destinationfiles
	not_installed=$?
	if [ "$not_installed" -eq "0" ]; then
		check_root
		isroot=$?
		if [ "${isroot}" -eq "0" ]; then
			echo "You must be root for doing this operation."
			exit 0
		fi
		echo -n "Uninstalling Unlimited Strength JCE files..."
		if [ ! -e "${jresecuritydir}/US_export_policy.jar.${_ext}" -a \
		     ! -e "${jresecuritydir}/local_policy.jar.${_ext}" ]; then
		     echo "Previous backup of the files doesn't exist!"
		     echo "For uninstall, reinstall the jre package."
		     exit 0
		fi

		mv ${jresecuritydir}/US_export_policy.jar.${_ext} ${jresecuritydir}/US_export_policy.jar || return 1
		mv ${jresecuritydir}/local_policy.jar.${_ext} ${jresecuritydir}/local_policy.jar || return 1
		echo " uninstalled."
	else 
		if [ -e "${jresecuritydir}/US_export_policy.jar.${_ext}" -a \
		     -e "${jresecuritydir}/local_policy.jar.${_ext}" ]; then
		     check_root
		     isroot=$?
		     if [ "${isroot}" -eq "0" ]; then
			echo "You must be root for doing this operation."
			exit 1
	      	     fi
		     echo -n "Deleting old regular JCE files backup..."
		     rm ${jresecuritydir}/US_export_policy.jar.${_ext} || return 1
		     rm ${jresecuritydir}/local_policy.jar.${_ext} || return 1
		     echo  " deleted."
		fi

		if [ "${not_installed}" -eq "1" ]; then
			echo "Regular JCE files already installed."
		fi
	fi
}

case "$1" in
	install) install
		 ;;
	uninstall) uninstall
		   ;;
	*) echo "Usage $0: {install|uninstall}"
	   ;;
esac
exit 0
