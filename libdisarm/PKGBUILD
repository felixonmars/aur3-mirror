# Maintainer: Guillermo Ramos <0xwille at gmail dot com>

pkgname="libdisarm"
pkgver=0.1
pkgrel=1
pkgdesc="Disassembler library for ARM machine code"
arch=('i686' 'x86_64')
url="http://iriver-t10.sourceforge.net/libdisarm-api.html"
license=('GPL2')
#depends=("glibc")
options=(!libtool)
source="http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2"
md5sums='b1072691756fa166affe4258b67b478b'
sha256sums='9044b4fde0afe21e7d2ed5799b94d36ede2becef2920a046dc6b9a16388679f8'

build() {
	cd "$srcdir/$pkgname-$pkgver"

	msg "Configuring..."
	./configure --prefix=/usr

	msg "Building..."
	make

	msg "Installing..."
	make DESTDIR=$pkgdir install
}
