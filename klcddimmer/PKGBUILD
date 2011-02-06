# Contributor: Sebastian Oechsle <soechsle@taunusstein.net>

pkgname=klcddimmer
pkgver=0.3
pkgrel=1
pkgdesc="LCD brightness applet for KDE using SmartDimmer"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/klcddimmer"
license=('GPL')
depends=(smartdimmer)
makedepends=()
source=(http://downloads.sourceforge.net/klcddimmer/klcddimmer-0.3.tar.gz)
md5sums=('17a14f9fe2f3136329b4883c46ad9f5e')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	  mkdir -p $startdir/pkg/opt/kde
	  ./configure --prefix=$startdir/pkg/opt/kde || return 1

	  make || return 1
          make install || return 1
}