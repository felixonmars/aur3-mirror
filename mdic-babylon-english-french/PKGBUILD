# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>

pkgname=mdic-babylon-english-french
_pkgname="Babylon_English_French"
_updict="Dictionaries"
pkgver=1.0
pkgrel=1
pkgdesc="MDic Babylon English-French dictionary(149835 entries)."
url="http://mdic.gnufolks.org/dictionaries.html"
arch=(any)
license=("GPL3")
depends=("mdic")
install="$pkgname.install"
makedepends=()
source=("http://sourceforge.net/projects/mdic/files/$_updict/$_updict/$_pkgname.m2.bz2")
md5sums=('51abf3fd5105099093e4d2fdc1edfcfe')

package() {
	cd $srcdir
	mkdir -p "${pkgdir}/usr/lib/mdic/dictionaries/"
	install -Dm644 "$_pkgname.m2.bz2" "${pkgdir}/usr/lib/mdic/dictionaries/$_pkgname.m2.bz2"
}
