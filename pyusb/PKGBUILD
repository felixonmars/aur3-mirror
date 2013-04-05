# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>
pkgname=pyusb
pkgver=0.4.3
pkgrel=4
pkgdesc="A native Python module written in C which provides USB access."
arch=('i686' 'x86_64')
url="http://pyusb.berlios.de/"
license=('GPL')
depends=('python2' 'libusb-compat')
makedepends=('python2-distribute')
source=(http://downloads.sourceforge.net/project/pyusb/PyUSB%200.x/$pkgver/pyusb-$pkgver.tar.gz)
md5sums=('a1a43bc6407caccbc22073c56439aa06')

build() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py build
}

package() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install -f --root=$pkgdir
}
