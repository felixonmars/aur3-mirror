# Maintainer: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=o2-tools
pkgver=2.00
pkgrel=1
pkgdesc="Image processing tools and libraries."
arch=('i686' 'x86_64')
url="http://www.imglab.org/"
license=('custom')
depends=('netpbm')
makedepends=('autoconf' 'make')
source=(http://www.imglab.org/p/O2/archives/O2-tools-$pkgver.tar.gz)
md5sums=(72cff9b6595336ca7df40c4700b224d1) #generate with 'makepkg -g'

build() {
  cd $srcdir/O2-tools-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  rm $pkgdir/usr/bin/bmptopnm ||return 1
}
 
 
