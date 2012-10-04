# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A session selector similar to CDM."
url=http://twitter.com/#!/@IruDog
arch=('any')
pkgver=0.1
pkgrel=1
license=('GPL')
depends=()
source=('tdm')
md5sums=(f3e8e4224b69847cac9460c730acea62) 
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


