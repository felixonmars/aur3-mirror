#Contributor: Sergio de Almeida <enigma@k1.com.br>
#Maintainer: "enigma@k1.com.br"
pkgname=contact-lookup-applet
pkgver=0.16
pkgrel=1
pkgdesc="contact lookup applet for gnome"
url="http://www.burtonini.com/computing"
provides=('contact-lookup-applet')
conflicts=('contact-lookup-applet')
depends=(evolution)
makedepends=(evolution)
replaces=()
backup=()
arch=('i686' 'x86_64')
license=('GPL')
md5sums=('203ebab0a647d32c9960686a20b43d30')
source=("http://www.burtonini.com/computing/$pkgname-$pkgver.tar.gz")

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure prefix=/usr 
	make || return 1
	make DESTDIR=$startdir/pkg install
}
