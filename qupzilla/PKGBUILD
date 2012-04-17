# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=QupZilla
pkgname=qupzilla
pkgver=1.2.0
pkgrel=2
pkgdesc="Cross-platform QtWebKit browser"
arch=(i686 x86_64)
url="http://www.qupzilla.com/"
license=('GPL3')
depends=('qtwebkit')
install="$pkgname.install"
source=("https://github.com/$_name/$pkgname/tarball/v$pkgver")
md5sums=('fc689dcda60a45d7b1aed32ecb851c1a')

build() {
  cd "$srcdir/$_name-$pkgname-"*

  # enable webgl
  export USE_WEBGL=true

  qmake QUPZILLA_PREFIX=/usr/
  make
}

package() {
  cd "$srcdir/$_name-$pkgname-"*
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
