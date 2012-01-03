# Maintainer: Tim Hatch <tim@timhatch.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

pkgname=pyusb10
_name=pyusb
pkgver=1.0.0_a2
_realver=${pkgver/_/}
pkgrel=1
pkgdesc="A native Python module written in C which provides USB access."
arch=('i686' 'x86_64')
url="http://pyusb.berlios.de/"
license=('GPL')
depends=('python2' 'libusb')
conflicts=('pyusb')
source=("http://downloads.sourceforge.net/project/${_name}/PyUSB%201.0/1.0.0-alpha-2/pyusb-1.0.0a2.tar.gz")
md5sums=('9136b3dc019272c62a5b6d4eb624f89f')
optdepends=('libusb-beta: libusb 1.0 api')

build() {
	cd $startdir/src/$_name-$_realver
	python2 setup.py install -f --root=$startdir/pkg || return 1
}
