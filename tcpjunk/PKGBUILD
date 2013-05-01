# Contributor: Leos Mach <leos@darkfate.net>
pkgname=tcpjunk
pkgver=2.9.03
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Tcpjunk is a general TCP protocols testing and hacking utility"
url="http://code.google.com/p/tcpjunk/"
license=('GPL2')
depends=('gtk2' 'openssl' 'pkgconfig' 'gtksourceview2')
source=(http://tcpjunk.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('0f008da6e5ef3afc3eaeaed1767ca39f')

build() {
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr
make
}

package() {
cd $srcdir/$pkgname-$pkgver
DESTDIR=$pkgdir make install
}

