# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=symbolic
pkgver=0.25
pkgrel=1
pkgdesc="A library for manipulating mathematical expressions"
arch=('i686' 'x86_64')
url="http://functy.sourceforge.net/"
license=('MIT')
source=(http://sourceforge.net/projects/functy/files/Symbolic/$pkgver-src/$pkgname-$pkgver.0-src.zip)
md5sums=('c945578fdaa6a7a3dbe1e14d15d015e0')


build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr LIBS=-lm
  make
}

package() {
  cd $pkgname-$pkgver
  
  make DESTDIR=$pkgdir install
  # move license file
  cd $pkgdir/usr/share/doc/$pkgname
  install -m755 -d ../../licenses/$pkgname
  mv -f COPYING ../../licenses/$pkgname/COPYING
}
