# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/tslib-git

_pkgname=tslib
pkgname=tslib-git
pkgver=20130320
pkgrel=1
pkgdesc="Touchscreen access library."
url="http://tslib.berlios.de/"
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL')

depends=('glibc')
makedepends=('git')
conflicts=('tslib')
provides=('tslib')

source=("git://github.com/kergoth/tslib")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
