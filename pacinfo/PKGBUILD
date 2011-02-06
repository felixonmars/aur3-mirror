# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgname=pacinfo
pkgver=0.1
pkgrel=1
pkgdesc="package information utility for pacman written in Mono/GTK#"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pacinfo/"
license=('GPL')
depends=('mono>=2.8.2' 'gtk-sharp-2'  )
makedepends=('pkg-config')
source=(http://pacinfo.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('a9b510327d0ab4989a4c73fa1990ae38')

build() {
  export MONO_SHARED_DIR=$srcdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm -r $MONO_SHARED_DIR
}

