# Maintainer: perlawk
pkgname=teyjus_i386
_pkgname=teyjus
pkgver=1.0
_pkgver=1.0-b35
pkgrel=1
pkgdesc="The Teyjus system is an efficient implementation of the higher-order logic programming language Lambda Prolog. i386 only"
url='http://teyjus.cs.umn.edu/old/index.html'
arch=('i686' 'x86_64')
license=('GPL2')
depends=()
makedepends=()
conflicts=('teyjus-svn' 'teyjus')
source=(http://teyjus.cs.umn.edu/old/releases/teyjus.tar.gz)

build () {
  cd "$srcdir/${_pkgname}-${_pkgver}"
	touch confmem_script
	chmod +x confmem_script
	sed -i 's/confmem_script/.\/confmem_script/;' configure
	if [ "$CARCH" = x86_64 ] ; then
  	./configure CC="gcc -m32" --prefix=/usr
	else
  	./configure --prefix=/usr
	fi
  make
}

package() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
	mkdir -p "$pkgdir/usr/bin"
	cd source
	cp teyjus tj* "$pkgdir/usr/bin"
}

md5sums=('44cd014a0abf6684fddf9a6e409e9ad1')
