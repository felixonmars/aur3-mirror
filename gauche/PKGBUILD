# Contributor: nkoizu <nkoizu@gmail.com>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gauche
pkgver=0.9.3.3
pkgrel=1
url="http://practical-scheme.net/gauche/index.html"
pkgdesc="R5RS Scheme implementation developed to be a handy script interpreter"
depends=('gdbm' 'zlib' 'slib')
license=('BSD')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/gauche/Gauche-$pkgver.tgz)
md5sums=('5090ddccd8aa4d9995a73c20e7a355e8')
install=$pkgname.install

build() {
  cd $srcdir/Gauche-$pkgver
  ./configure --prefix=/usr --enable-multibyte=utf-8 \
    --enable-threads=pthreads
  make
}
package() {
  cd $srcdir/Gauche-$pkgver
  make DESTDIR=$pkgdir install-pkg install-doc
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
