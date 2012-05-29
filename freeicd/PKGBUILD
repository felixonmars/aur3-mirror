# Maintainer: speps <speps at aur dot archlinux dot org>

_name=freemedforms
pkgname=freeicd
pkgver=0.7.3
pkgrel=1
pkgdesc="The FreeMedForms multilingual coding assistant for the International Classification of Diseases version 10 (ICD10)"
arch=(i686 x86_64)
url="http://www.freemedforms.com/en/"
license=('GPL')
depends=('qt')
install="$pkgname.install"
source=("http://freemedforms.googlecode.com/files/${_name}fullsources-$pkgver.tgz")
md5sums=('4c4797612aba8559aea86a6967b27e97')

build() {
  cd "$srcdir/$_name-$pkgver"

  qmake $pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"

  make
}

package() {
  cd "$srcdir/$_name-$pkgver"

  make install

  # fix doc directories exec bit
  chmod a+x "$pkgdir/usr/share/$pkgname/forms"{,/subforms/emergencies}
  chmod a+x "$pkgdir/usr/share/doc/$_name-project/freeicd/"{en,fr}
}

# vim:set ts=2 sw=2 et:
