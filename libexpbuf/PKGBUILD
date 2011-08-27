# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libexpbuf
pkgver=1.04.10
_gitmd5=6a3e448
pkgrel=1
pkgdesc="Library for a simple expanding buffer"
arch=(i686)
url="http://dev.rhokz.com/libexpbuf"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://download.github.com/hyper-$pkgname-v$pkgver-0-g$_gitmd5.zip)
noextract=()
md5sums=('f0301b0e9c9ac37352259e9779c029ac')

build() {
  cd "$srcdir/hyper-$pkgname-$_gitmd5/src/$pkgname"
  make
}

package() {
  cd "$srcdir/hyper-$pkgname-$_gitmd5/src/$pkgname"
  mkdir -p $pkgdir/usr/lib


#  make DESTDIR="$pkgdir/" install


  mkdir -p $pkgdir/usr/lib
  cp $srcdir/hyper-$pkgname-$_gitmd5/src/$pkgname/libexpbuf.so.1.0.1 $pkgdir/usr/lib/
  chmod 644 $pkgdir/usr/lib/libexpbuf.so.1.0.1
}

# vim:set ts=2 sw=2 et:
