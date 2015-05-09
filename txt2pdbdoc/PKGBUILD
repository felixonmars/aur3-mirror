# Contributor: jj <markiza@gmail.com>

pkgname=txt2pdbdoc
pkgver=1.4.4
pkgrel=4
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Text to PalmOS Doc file conversion program."
url="http://homepage.mac.com/pauljlucas/software/txt2pdbdoc/"
source=(ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('66bc7890210af2125b0cabcdf581651a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}
