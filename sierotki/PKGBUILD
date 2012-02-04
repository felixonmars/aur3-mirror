# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=sierotki
pkgver=20100331
pkgrel=1
pkgdesc="Removes hanging conjunction from LaTeX documents"
arch=("any")
license=('cc-by-sa-3.0')
url="http://neo.infeo.pl/sierotki/"
depends=('bash' 'sed')
source=("http://neo.infeo.pl/sierotki/sierotki")
sha1sums=('f69762c9e7b668bc8a4257c4a3446da3c6e3a558')

build() {
	mkdir -p $pkgdir/usr/bin
	install sierotki $pkgdir/usr/bin/sierotki -m 755 || return 1
}
