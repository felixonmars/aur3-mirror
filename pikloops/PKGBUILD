# Contributor: Marcel Schneider marcelATcoopmastersDOTde

pkgname=pikloops
pkgver=0.2.5
pkgrel=4
pkgdesc="A stand alone Pic delay code generator which is used by Pikdev"
url="http://pikloops.sourceforge.net/"
license=('GPL')
arch=('i686')
depends=( 'kdelibs3' )

#http://downloads.sourceforge.net/project/pikloops/pikloops/Version%200.2.5/pikloops-0.2.5.tar.bz2?use_mirror=puzzle&ts=1280000635
source=(http://dl.sourceforge.net/pikloops/pikloops/Version%20$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('c96a5fb7823fb63f8dcfd44a0ee4d6e2')

build() {
	cd $startdir/src/$pkgname-$pkgver

  	./configure  --without-arts
  	make || return 1
  	make DESTDIR=$startdir/pkg install
}

