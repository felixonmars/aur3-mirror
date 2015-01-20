# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
# Contributor: Sébastien Luttringer
# Contributor: Baumi <baumi@gmx.com>

pkgname=sfk
pkgver=1.7.3
pkgrel=1
pkgdesc='Swiss File Knife - A Command Line Tools Collection'
arch=('i686' 'x86_64')
url='http://stahlforce.com/dev/?tool=sfk'
license=('custom: BSD')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/swissfileknife/${pkgname}${pkgver//./}.zip")
md5sums=('4b54eb70cdc1652773531fa322fdcc5f')

build() {
  cd ${pkgname}${pkgver//./}
  g++ $CXXFLAGS $LDFLAGS sfk.cpp sfkext.cpp -o $pkgname
}

package() {
  cd ${pkgname}${pkgver//./}
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -D -m444 bsd-license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
