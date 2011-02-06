# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=extace
pkgver=1.9.8
pkgrel=1
pkgdesc="a 3D audio visualization tool"
arch=('i686')
url="http://extace.sourceforge.net/"
license=('GPL2')
depends=('fftw' 'esound' 'gtk2')
source=(http://downloads.sourceforge.net/extace/$pkgname-$pkgver.tar.gz)
md5sums=('1d8e22d7fe0da1aac0b089ca30262241') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
