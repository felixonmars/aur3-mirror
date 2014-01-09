# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ying@althonx4>
pkgname=libcsv  
pkgver=3.0.3
pkgrel=2 
pkgdesc="C library for csv format"
url="http://sourceforge.net/projects/libcsv/"
arch=('i686' 'x86_64')
license=('GPL')
install=
source=(http://nchc.dl.sourceforge.net/project/libcsv/libcsv/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=$pkgdir/usr
  make 
}

package() {
  cd $startdir/src/$pkgname-$pkgver
	make install
}

md5sums=('d3307a7bd41d417da798cd80c80aa42a')
