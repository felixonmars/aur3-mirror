# Maintainer: pktfag <pktfag at gmail dot com>

pkgname=yachat
_pkgrevision=9055
pkgver=3.2.2.$_pkgrevision
pkgrel=1
pkgdesc="Chat module of Ya.Online is based on Psi"
arch=('i686' 'x86_64')
url="http://online.yandex.ru/mac-linux"
license=('GPL2')
depends=('qt>=4.5' 'libxss')
source=("http://download.yandex.ru/online/$pkgname-source.tar.gz" "yaeditorcontextmenu.patch")
install=$pkgname.install

md5sums=('7a293932fc321324b2de642e6ed2f3c7'
         'c829de9e688234befe334efcc41892cc')

build() {
	cd "$srcdir/$pkgname-source-$_pkgrevision"
	patch -p0 < "$srcdir/yaeditorcontextmenu.patch"
	./configure --prefix=/usr 

	make  || return 1
}

package() {
	cd "$srcdir/$pkgname-source-$_pkgrevision"
	make INSTALL_ROOT="$pkgdir" install
}
