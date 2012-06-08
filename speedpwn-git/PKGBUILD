# Maintainer: Max Roder <maxroder@web.de>

pkgname='speedpwn-git'
pkgver=20120609
pkgrel=1
pkgdesc='Active WPA/2 Bruteforcer, original created to prove weak standard key generation in different ISP labeled routers'
arch=('i686' 'x86_64')
url="http://gitorious.org/speedpwn"
license=('GPL')
depends=('openssl')
conflicts=('speedpwn')
source=('http://download.aircrack-ng.org/aircrack-ng-1.1.tar.gz')
sha256sums=('b136b549b7d2a2751c21793100075ea43b28de9af4c1969508bb95bcc92224ad')
_gitroot='git://gitorious.org/speedpwn/speedpwn.git'
_gitname='speedpwn'

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 ${_gitroot} ${_gitname}
	fi
	msg "GIT checkout done or server timeout"

	# Prepare...
	cd ${srcdir}/aircrack-ng-1.1/src/
	cp ../../speedpwn/* .
	cd osdep
	make

	# Make
	cd ${srcdir}/aircrack-ng-1.1/src/
	gcc -lssl -lcrypto -o speedpwn speedpwn.c common.c osdep/libosdep.a crypto_branch.c
}

package() {
	cd ${srcdir}
	install -Dm 755 aircrack-ng-1.1/src/speedpwn ${pkgdir}/usr/bin/speedpwn
	install -Dm 755 speedpwn/speedport-arcadyan.pl ${pkgdir}/usr/bin/speedport-arcadyan.pl
	install -Dm 644 speedpwn/README ${pkgdir}/usr/share/doc/speedpwn/README
}

# vim:set ts=2 sw=2 et:
