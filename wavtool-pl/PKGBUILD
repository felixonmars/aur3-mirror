# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=wavtool-pl
pkgver=20140305
pkgrel=1
pkgdesc="A drop-in replacement for wavtool inside UTAU"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/wavtool-pl/"
license=('GPL3')
depends=('libsndfile')
source=("http://jaist.dl.sourceforge.jp/wavtool-pl/60758/wavtool-pl-win32-${pkgver}.7z")

build() {
	cd "${srcdir}/wavtool-pl"
	autoreconf -vfi
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/wavtool-pl"
	make DESTDIR="${pkgdir}" install
}

md5sums=('acb9818281390b087e17c94718587c21')
