# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=theseus
pkgver=2.0.1
pkgrel=2
pkgdesc="Application for maximum likelihood superpositioning and analysis of macromolecular structures"
arch=('i686' 'x86_64')
url="http://www.theseus3d.org"
license=('GPL')
depends=('gsl')
optdepends=('probcons: For theseus_align script')
source=("http://www.theseus3d.org/src/${pkgname}_$pkgver.tar.gz")
md5sums=('cf1fb73da0c72eba364cfb29556b881a')

build() {
	cd "$srcdir/${pkgname}_src"
        # Fix for gcc >=4.6
        sed -i 's/\(Wno-error=unused-result\)/\1 -Wno-error=unused-but-set-variable/' make.inc
	make
}

package() {
	cd "$srcdir/${pkgname}_src"
        install -D theseus "$pkgdir/usr/bin/theseus"
        install -D theseus_align "$pkgdir/usr/bin/theseus_align"
        install -D -m644 theseus.1 "$pkgdir/usr/share/man/man1/theseus.1"
}
