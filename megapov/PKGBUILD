pkgname=megapov
pkgver=1.2.1
pkgrel=1
pkgdesc="MegaPOV is a custom unofficial version of POV-Ray  with a lot of additional features."
url="http://megapov.inetart.net/"
license="GPL"
depends=(svgalib)
source=(http://megapov.inetart.net/packages/unix/$pkgname-$pkgver.tar.bz2)
md5sums=('0d8fb86e6a583257023bf3bb2d43a357')

build() {
  cd $startdir/src/$pkgname-$pkgver
  COMPILED_BY="bogus andorn@gmail.com" ./configure --prefix=/usr --sysconfdir=/etc --with-svga 
  make || return 1
  make DESTDIR=$startdir/pkg install
}
