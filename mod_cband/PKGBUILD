# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=mod_cband
pkgver=0.9.7.5
pkgrel=3
pkgdesc='An Apache 2 module to control bandwidth.'
arch=('i686' 'x86_64')
url='http://cband.linux.pl'
depends=('apache')
source=("http://cband.linux.pl/download/mod-cband-$pkgver.tgz")
license=('GPL-2')
install=('mod_cband.install')
md5sums=('5c5d65dc9abe6cdc6931b6dd33be5018')

build() {
  cd $srcdir/mod-cband-$pkgver

  ./configure --prefix=$pkgdir
  make
}

package() {
  cd $srcdir/mod-cband-$pkgver

  # DESTDIR is unsupported, --prefix=$pkgdir does not work
  install -D -m755 src/.libs/mod_cband.so $pkgdir/usr/lib/httpd/modules/mod_cband.so
}
# vim:syntax=sh

