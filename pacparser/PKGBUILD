# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Max Meyer <dev@fedux.org>
pkgname=pacparser
pkgver=1.3.0
pkgrel=1
pkgdesc="Library to parse proxy auto-config (PAC) files"
arch=(i686 x86_64)
url="http://pacparser.googlecode.com"
license=('LGPL')
makedepends=(make)
options=(!libtool)
source=("http://pacparser.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('6dcfda10803913df38249fb39990dd87') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -C src || return 0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -C src DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
