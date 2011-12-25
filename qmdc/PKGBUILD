pkgname=qmdc
pkgver=0.2.0
pkgrel=0
pkgdesc="A PyQt4 client for musicd."
arch=('i686' 'x86_64')
url="http://tsundere.fi/musicd/"
license=('GPL')
makedepends=('pkg-config')
depends=('python2' 'ffmpeg' 'libao' 'python2-pyqt' 'dbus-python')
source=("https://github.com/Kray/qmdc/tarball/v$pkgver")
md5sums=('923c59bb0087c416521a3d6a45176f4e')

build() {
	cd $srcdir/Kray-qmdc-* #This is... ugly
	make PREFIX=${pkgdir}/usr install
}
