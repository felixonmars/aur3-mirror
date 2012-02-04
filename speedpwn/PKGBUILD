# Maintainer: Smith314 <smith-@live.de>

pkgname=speedpwn
pkgver=0.4
pkgrel=2
pkgdesc="Active WPA/2 Bruteforcer, original created to prove weak standard key generation in different ISP labeled routers"
arch=('i686' 'x86_64')
url="http://gitorious.org/speedpwn"
license=('GPLv3')
depends=('openssl')
makedepends=()
provides=('speedpwn')
source=('http://download.aircrack-ng.org/aircrack-ng-1.1.tar.gz' 'http://smith.freeunix.net/patch-common' 'http://www.wardriving-forum.de/forum/attachment.php?attachmentid=1113&d=1303560777')
md5sums=('f7a24ed8fad122c4187d06bfd6f998b4' '6191a238e4f8110900a1a3621238d19f' 'c3adac665ac3139660269e3730c60144')

build() {
	cd ${srcdir}/aircrack-ng-1.1
	patch -p1 < ../patch-common
	cp ../speedpwn-0.4/* src/
	cd src/osdep
	make
	cd ../
	gcc -o ${srcdir}/speedpwn speedpwn.c common.c osdep/libosdep.a crypto.c `pkg-config --libs openssl`
}

package() {
	cd ${srcdir}
	install -D -m755 speedpwn "$pkgdir/usr/bin/speedpwn"
}
