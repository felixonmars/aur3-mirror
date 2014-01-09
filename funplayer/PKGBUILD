# maintainer: a304yuanyuan at gmail.com

pkgname=funplayer
pkgver=0.15.1
pkgrel=1
pkgdesc="A qt font-end for mplayer with the abilities of watching and downloading videos from network"
arch=('i686' 'x86_64')
url="http://code.google.com/p/funplayer"
license=('GPL')
depends=('qt4' 'python2' 'mplayer')
makedepends=('git')
source=("git+https://code.google.com/p/funplayer/")
sha1sums=('SKIP')

build() {
	cd $srcdir/$pkgname

	sed -i 's/python/python2/g' funPlayer.pro

	qmake-qt4 funPlayer.pro

	make
}

package() {
	cd $srcdir/$pkgname

	make INSTALL_ROOT=$pkgdir install

	cd $pkgdir/usr/share

	mv icons pixmaps
}