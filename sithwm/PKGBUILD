# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sithwm  
pkgver=1.2.3
pkgrel=4
pkgdesc="a minimalist window manager"
url="http://sithwm.darkside.no/sithwm.html"
arch=('i686' 'x86_64')
depends=('libx11')
license=('GPL')
install=sithwm.install
source=("http://sithwm.darkside.no/sn/$pkgname-$pkgver.tgz")
md5sums=('15619f6977bb0cff32a1cdce49f6530d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
