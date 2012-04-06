# $Id: PKGBUILD 150554 2012-02-18 13:03:41Z pierre $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=qhull-ros
_pkgname=qhull
pkgver=2012.1
pkgrel=3
pkgdesc="A general dimension code for computing convex hulls and related structures"
arch=('i686' 'x86_64')
url="http://www.qhull.org/"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
provides=('qhull')
source=("http://www.qhull.org/download/$_pkgname-$pkgver-src.tgz")
options=('!libtool')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir srcbuild
  cd srcbuild
export CFLAGS="$CFLAGS -fPIC"
export CXXFLAGS="$CXXFLAGS -fPIC"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDOC_INSTALL_DIR=/usr/share/doc \
    -DMAN_INSTALL_DIR=/usr/share/man/man1 -DLIB_INSTALL_DIR=/usr/lib ..
  make
}

package() { 
  cd "$srcdir/$_pkgname-$pkgver/srcbuild"

  make DESTDIR=$pkgdir install

  # Install license
  install -Dm644 $srcdir/$_pkgname-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$_pkgname/license.txt"
}
md5sums=('d0f978c0d8dfb2e919caefa56ea2953c')
