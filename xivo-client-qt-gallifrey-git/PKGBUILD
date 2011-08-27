# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname='xivo-client-qt-gallifrey-git'
pkgver=20110215
pkgrel=1
pkgdesc="XiVO client QT (Gallifrey version)"
arch=('i686' 'x86_64')
url='http://wiki.xivo.fr'
license=('GPL3')
depends=('qt')
makedepends=('git' 'upx')
provides=('xivo-client')
conflicts=('xivo-client-qt-git')
source=(xivo-client)
md5sums=('ad53290a0740b49d04e6527329435b5a')
_gitroot="git://git.proformatique.com/official/xivo-client-qt.git"
_gitname="1.1-gallifrey"

build() {
	msg "Connecting to the GIT server...."
	if [[ -d ${srcdir}/xivo-client-qt ]] ; then
		cd ${srcdir}/xivo-client-qt
		git pull origin
		msg "The local files are updated..."
	else
		git clone -b ${_gitname} ${_gitroot} --depth 1
	fi
	msg "GIT checkout done."
 
	cd ${srcdir}/xivo-client-qt/
	make all-linux
}

package() {
	mkdir -p ${pkgdir}/opt/xivo-client/{plugins,lib}
	mkdir -p ${pkgdir}/usr/bin
	install -D -m 755 -o root -g root ${srcdir}/xivo-client-qt/bin/xivoclient ${pkgdir}/opt/xivo-client/
	install -D -m 755 -o root -g root ${srcdir}/xivo-client-qt/bin/libxivoclientbaselib.so.1.1.0 ${pkgdir}/opt/xivo-client/lib/
	install -D -m 755 -o root -g root ${srcdir}/xivo-client-qt/bin/plugins/* ${pkgdir}/opt/xivo-client/plugins/
	cd ${pkgdir}/opt/xivo-client/lib/
	ln -s libxivoclientbaselib.so.1.1.0 libxivoclientbaselib.so.1.1
	ln -s libxivoclientbaselib.so.1.1.0 libxivoclientbaselib.so.1
	ln -s libxivoclientbaselib.so.1.1.0 libxivoclientbaselib.so
	install -D -m 755 -o root -g root ${srcdir}/xivo-client ${pkgdir}/usr/bin/
}
