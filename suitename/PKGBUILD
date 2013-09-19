# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=suitename
pkgver=0.3.070628
pkgrel=1
pkgdesc="Suitename is a new C program that supports the ROC RNA Ontology Consortium consensus RNA backbone nomenclature and conformer-list development"
arch=('i686' 'x86_64')
url="http://kinemage.biochem.duke.edu/software/suitename.php"
license=('custom')
source=(LICENSE
        http://kinemage.biochem.duke.edu/php/downlode.php?filename=/downloads/software/${pkgname}/${pkgname}.${pkgver}.src.tgz)
md5sums=('805d15fa99a62a29462cb23fe445fd09'
         'ba1a278e2440c41044ca2d968ce9dd22')

build() {
	cd "$srcdir/$pkgname.$pkgver"
	make CFLAGS="$CFLAGS" -f Makefile.linux
}

package() {
	cd "$srcdir/$pkgname.$pkgver"
    install -D $pkgname "$pkgdir/usr/bin/$pkgname"
    install -D ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
