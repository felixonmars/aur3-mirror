# Contributor: Karol Grochowalski <karol.grochowalski@gmail.com>

pkgname=pogodynka
pkgver=0.4
pkgrel=1
pkgdesc="pogodynka - fetch weather cast and display it in terminal, in conky, OSD, etc."
arch=('i686' 'x86_64')
url="http://www.pogodynka.fluxbox.org/"
license=('GPL')
depends=()
makedepends=('tar' 'gzip')
md5sums=('2ff082cd92514f769fcd9111bbdb5ee0')
source=(http://pogodynka.fluxboxpl.org/pogodynka/$pkgname\_$pkgver-2.tar.gz)


build() {
	cd $startdir/src/
  	tar -xzvf $startdir/pogodynka_0.4-2.tar.gz
	cp -r $startdir/src/usr $startdir/pkg/
  

}
