# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=freemedforms
pkgver=0.8.2.1
_pkgver=0.8.2
pkgrel=1
pkgdesc="Electronic Medical Record Manager"
arch=(i686 x86_64)
url="http://www.freemedforms.com/en/"
license=('GPL3')
depends=('qt5-script')
makedepends=('qt5-tools')
install="$pkgname.install"
source=("http://freemedforms.googlecode.com/files/${pkgname}fullsources-$pkgver.tgz")
md5sums=('1a5103f95ab2ee536a5e471015cf98d1')

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  qmake $pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make install

  # fix folders exec bit
  chmod a+x "$pkgdir"/usr/share/{$pkgname/forms,doc/$pkgname-project/$pkgname/{en,fr}}
}

# vim:set ts=2 sw=2 et:
