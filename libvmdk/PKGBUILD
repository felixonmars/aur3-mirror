# Maintainer: Rudy Valencia <rudy.valencia@psiglenmere.com>
pkgname=libvmdk
pkgver=20150105
pkgrel=1
pkgdesc="A library and utility suite for reading the VMware Virtual Disk (VMDK) format"
arch=('i686' 'x86_64')
url="https://github.com/libyal/libvmdk/"
license=('LGPL3')
depends=('python' 'fuse' 'zlib')
source=("libvmdk-$pkgver.tar.gz::https://github.com/libyal/libvmdk/archive/$pkgver.tar.gz")
md5sums=('0ed7ba1edadb814afda9af54368dcca8')

build() {
	cd "libvmdk-$pkgver"
	./synclibs.sh
	./autogen.sh
	./configure --prefix=/usr --enable-wide-character-type --enable-python
	make
}

check() {
	cd "libvmdk-$pkgver"
	make -k check
}

package() {
	cd "libvmdk-$pkgver"
	libtool --finish /usr/lib
	make DESTDIR="$pkgdir" install
}
