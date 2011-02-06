# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=kfolding
pkgver=1.0.0
_pkgrel=rc2
pkgrel=1
pkgdesc="A KDE applet to monitor, visualise, and control the Folding@home client" 
arch=(i686 x86_64 ppc)
url="http://members.shaw.ca/khessels/kfolding" 
license="GPL" 
depends=('kdelibs>=3.2') 
conflicts=()
replaces=()
install=()
backup=()
source=(http://members.shaw.ca/khessels/$pkgname/src/$pkgname-$pkgver-$_pkgrel.tar.gz) 
md5sums=('ea7051632f9d42873107504a0bcc19e5')

build() { 
	cd $srcdir/$pkgname-$pkgver-$_pkgrel
        ./configure
        make
	make install DESTDIR=$pkgdir || return 1
}
