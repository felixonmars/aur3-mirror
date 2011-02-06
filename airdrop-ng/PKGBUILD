# contributor: fnord0 [fnord0 <AT> riseup <DOT> net] 
pkgname=airdrop-ng
pkgver=1786
pkgrel=3
pkgdesc="Used for targeted, rule-based deauthentication of users. It can target based on MAC address, type of hardware, (OUI lookup) or completely deauthenticate ALL users"
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org/doku.php?id=airdrop-ng"
license=('GPLv2')
depends=('python2' 'lorcon-old-svn' 'pylorcon')
makedepends=('subversion')
optdepends=("psyco: JIT compiler for python")
source=()
md5sums=() 

_svntrunk="http://trac.aircrack-ng.org/svn/trunk/scripts/airdrop-ng"

build() {
        cd ${startdir}/src

        if [ -d ${pkgname}/.svn ]; then
        msg "Updating airdrop-ng SVN..."
                cd ${pkgname} && svn up
        else
        msg "Checking out airdrop-ng SVN..."
                svn co ${_svntrunk} -r ${pkgver} ${pkgname}
        fi

        msg "SVN checkout done or server timeout"
        msg "Starting make..."
        cd ${startdir}/src/${pkgname}
	if [ -d ${pkgname}build/ ]; then
		rm -rf ${pkgname}build
		msg "Build exists, cleaning it up... "
		install -d build
	else
		msg "Creating build folder... "
		install -d build
	fi
	cp -p airdrop-ng build/ && cp -pr lib build/ && cp -pr docs/airdrop-ng.1 build/ && cp -p README docs/*.txt build/ && cp -p docs/*.example build/ || return 1
	grep -rl python build/ | xargs sed -i 's|python|python2|g' || return 1
	cd build
	install -d ${pkgdir}/usr/bin || return 1
	install -d ${pkgdir}/usr/lib/airdrop-ng || return 1
	install -d ${pkgdir}/usr/share/man/man1 || return 1
	install -d ${pkgdir}/usr/share/airdrop-ng || return 1
	cp -p airdrop-ng ${pkgdir}/usr/bin/ || return 1
	cp -p lib/* ${pkgdir}/usr/lib/airdrop-ng/ || return 1
	cp -p *.txt ${pkgdir}/usr/share/airdrop-ng || return 1
	cp -p *.example ${pkgdir}/usr/share/airdrop-ng || return 1
	cp -p README ${pkgdir}/usr/share/airdrop-ng || return 1
	cp -p airdrop-ng.1 ${pkgdir}/usr/share/man/man1/ || return 1
	cd ..
	rm -rf ${svnmod}/build || return 1
	echo -e ""
	echo -e "\e[1;34m[\e[0m\e[1;31m*\e[0m\e[1;34m]\e[0m \e[1;31mrun \e[1;34m'\e[0m\e[1;31m/usr/bin/airdrop-ng -u\e[1;34m'\e[0m\e[1;31m to update the OUI file\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mthe file \e[1;34m'\e[0m\e[1;31m/usr/share/airdrop-ng/dropRules.conf.example\e[1;34m'\e[0m\e[1;31m explains the config file syntax via examples\e[0m"
	echo -e ""
}
