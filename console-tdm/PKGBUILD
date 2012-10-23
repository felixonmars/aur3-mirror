# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A session selector similar to CDM."
url=http://linux.bdwm.net
arch=('any')
pkgver=0.2
pkgrel=1
license=('GPL')
depends=('xorg-xinit')
source=('tdm')
md5sums=("ff80ead950165db23b4888e92bf2cab7")
install=tdm.install

build() {
	true
}

package(){
	mkdir -p $pkgdir/usr/bin
	cd $srcdir
	cp tdm $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin/tdm
}


