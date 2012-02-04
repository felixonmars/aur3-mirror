# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=mtftar
pkgver=1.5_2007_02_05
pkgrel=1
pkgdesc="A filter to translate MTF/BKF backup streams to the TAR archives used by the rest of the world."
arch=(i686 x86_64)
url="http://gpl.internetconnection.net/"
license=('GPL')
source=("${url}files/$pkgname.tar.gz")
md5sums=('e73af8a7f3d0fc6ac79be8cc44c375c0')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # readme
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
