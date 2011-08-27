# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=sqlninja-svn
pkgver=7
pkgrel=1
pkgdesc="A tool targeted to exploit SQL Injection vulnerabilities on a web application that uses Microsoft SQL Server as its back-end"
arch=('i686' 'x86_64')
url=("http://sqlninja.sourceforge.net")
license=('GPLv2')
depends=('perl' 'perl-netpacket' 'perl-net-pcap' 'perl-net-dns' 'perl-net-rawip' 'perl-io-socket-ssl')
makedepends=('subversion')
optdepends=('metasploit: to use the metasploit attack mode' 
	    'vnc: vncviewer, to use the VNC payload')
provides=('sqlninja')
conflicts=('sqlninja')
_svntrunk="https://sqlninja.svn.sourceforge.net/svnroot/sqlninja"
_svnmod=sqlninja

build() {
	if [ -d ${srcdir}/.svn ]; then
	  msg 'Updating...'
	  svn up ${srcdir} || return 1
	else
	  msg 'Checking out...'
	  svn co ${_svntrunk} ${srcdir} || return 1
	fi
	install -d ${pkgdir}/usr/{bin,src} || return 1
	install -d ${pkgdir}/usr/share/licenses/${_svnmod} || return 1
	cd ${pkgdir}/usr/src
	svn export ${srcdir} ${_svnmod} || return 1

	cd ${pkgdir}/usr/src/${_svnmod}
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE || return 1

	# archlinux fixes
	cd ${pkgdir}/usr/src/${_svnmod}
	#check if metasploit-svn or metasploit stable is installed (-svn takes presidence)
	#apply archlinux metasploit home directory to sqlninja.conf
	if [ -d /usr/src/metasploit ]; then
	  sed -i 's|/home/icesurfer/trunk/|/usr/src/metasploit|g' ./sqlninja.conf || return 1
	else
	  sed -i 's|/home/icesurfer/trunk/|/opt/metasploit|g' ./sqlninja.conf || return 1
	fi
	
        #create startup app /usr/bin/sqlninja
        echo "#!/bin/sh" > ${pkgdir}/usr/bin/${_svnmod}
        echo "cd /usr/src/sqlninja" >> ${pkgdir}/usr/bin/${_svnmod}
	echo "./sqlninja \"\$@\"" >> ${pkgdir}/usr/bin/${_svnmod}
	echo "cd -" >> ${pkgdir}/usr/bin/${_svnmod}
	chmod +x ${pkgdir}/usr/bin/${_svnmod}

	#user notification
	echo -e ""
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/sqlninja\e[0m\e[1;31m' to call the application\e[0m"
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31ma default configuration file resides at '\e[0m\e[1;34m/usr/src/sqlninja/sqlninja.conf\e[0m\e[1;31m'\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mthe sqlninja HOWTO resides at '\e[0m\e[1;34m/usr/src/sqlninja/sqlninja-howto.html\e[0m\e[1;31m'\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mmore information @ \e[0m\e[1;32mhttp://sqlninja.sourceforge.net\e[0m"
	echo -e ""
}
# vim:syntax=sh
