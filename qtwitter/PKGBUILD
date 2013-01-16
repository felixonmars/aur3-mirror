# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=qtwitter
pkgver=0.10.0
pkgrel=2
pkgdesc="A Qt interface to the Twitter social network"
arch=('i686' 'x86_64')
url="http://blog.ayoy.net/qtwitter"
license=('LGPL3')
depends=('qca-ossl' 'qoauth' 'qt>=4.5.0')
makedepends=('chrpath')
install=$pkgname.install
source=(http://files.ayoy.net/$pkgname/release/$pkgver/src/$pkgname-$pkgver-src.tar.gz)
md5sums=('cf91c87e29ab87d1043056a263c3af56')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's,\(LIB_SUFFIX = \)64,\1,' common.pri
  qmake LIBS+=/usr/lib/libX11.so.6 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  chrpath -d "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
