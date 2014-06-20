# Maintainer: Ricky <riccardo_aur at libero dot it>

pkgname=gimp-gap
pkgver=2.6.0
pkgrel=2
pkgdesc="A plug-in for GIMP for creating animations"
arch=('i686' 'x86_64')
url="http://www.gimp.org/downloads/"
license=('GPL')
depends=('gimp>=2.6.0' 'lame' 'xvidcore' 'faac' 'faad2')
makedepends=('intltool')
optdepends=('mplayer: splitting videos into frames support')
source=(http://download.gimp.org/pub/gimp/plug-ins/v2.6/gap/$pkgname-$pkgver.tar.bz2)
md5sums=('249ed829de8b78675c0fe4ef4212089f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr CFLAGS="$CFLAGS -fPIC -lm"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
