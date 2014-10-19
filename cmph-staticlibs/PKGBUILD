# Contributor: Benoit Favre <benoit.favre@gmail.com>
pkgname=cmph-staticlibs
pkgver=2.0
pkgrel=3
pkgdesc="C minimal perfect hashing library (with static libs)"
arch=('i686' 'x86_64')
url="http://cmph.sourceforge.net/"
license=('lgpl' 'mpl')
depends=('gcc')
provides=('cmph')
conflicts=('cmph')
options=('staticlibs')
source=("http://downloads.sourceforge.net/cmph/cmph-$pkgver.tar.gz")
md5sums=('020946deef7418d9daf4195556ecac12')

build() {
    cd "$srcdir/cmph-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
    cd "$srcdir/cmph-$pkgver"
	make DESTDIR=${pkgdir} install
    install -d "$pkgdir/usr/include"
    install -t "$pkgdir/usr/include" src/*structs.h src/*hash*.h
}
