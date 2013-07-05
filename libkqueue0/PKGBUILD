# Maintainer: SJ_UnderWater

pkgname=libkqueue0
pkgbase=libkqueue
pkgver=2.0.1
pkgrel=1
pkgdesc="Userspace implementation of the kqueue(2) kernel event notification mechanism"
url="http://mark.heily.com/libkqueue/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
provides=('libkqueue')
options=('!libtool')
source=(BSD http://iweb.dl.sourceforge.net/project/$pkgbase/$pkgbase-${pkgver%.*}/$pkgbase-$pkgver.tar.gz)
md5sums=('fb377363b4fc0168943ebbf67f978c32'
	'3d939aa5fa83a870aee71f2181b22994')

build() {
	cd $pkgbase-$pkgver
	msg2 "Configuring..."
	CFLAGS="-Wno-error" ./configure --prefix=/usr
	msg2 "Making..."
	make
}
package() {
	cd $pkgbase-$pkgver
	msg2 "Building..."
	make DESTDIR="$pkgdir" install
	install -D -m644 "$srcdir"/BSD "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
