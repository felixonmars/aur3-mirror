# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=qmrtg
pkgver=2.1
pkgrel=2
pkgdesc="A qmail activity analyzer"
arch=('i686')
url="http://dev.publicshout.org/qmrtg"
license=(custom)
source=(http://dev.publicshout.org/qmrtg/download/$pkgname-$pkgver.tar.bz2)
md5sums=('b95176b94e749eb25d00f8ff57c5e22f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -D doc/LICENSE.txt $startdir/pkg/usr/share/licenses/qmrtg/COPYING
}
