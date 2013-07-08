# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/lib32-tslib-git

_pkgbasename=tslib
_pkgname=lib32-"$_pkgbasename"
pkgname=lib32-tslib-git
pkgver=20130320
pkgrel=1
pkgdesc="Touchscreen access libraryi (32-bit)."
url="http://tslib.berlios.de/"
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL')

depends=("$_pkgbasename" 'lib32-glibc')
makedepends=('git')
conflicts=('lib32-tslib')
provides=('lib32-tslib')

source=("git://github.com/kergoth/tslib")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgbasename"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  export CC='gcc -m32'
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "$srcdir/$_pkgbasename"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$_pkgbasename"
  make check
}

package() {
  cd "$srcdir/$_pkgbasename"
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir"/{etc,usr/{bin,include}}
}

# vim:set ts=2 sw=2 et:
