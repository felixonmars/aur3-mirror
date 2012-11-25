# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>

pkgname=mdic-babylon-english-english
_pkgname="Babylon_English"
_updict="Dictionaries"
pkgver=1.0
pkgrel=1
pkgdesc="MDic Babylon English-English dictionary(139500 entries)."
url="http://mdic.gnufolks.org/dictionaries.html"
arch=(any)
license=("GPL3")
depends=("mdic")
install="$pkgname.install"
makedepends=()
source=("http://sourceforge.net/projects/mdic/files/$_updict/$_updict/$_pkgname.m2.bz2")
md5sums=('70ec6cb4caf0b54487a98a5e81183c58')

package() {
	cd $srcdir
	mkdir -p "${pkgdir}/usr/lib/mdic/dictionaries/"
	install -Dm644 "$_pkgname.m2.bz2" "${pkgdir}/usr/lib/mdic/dictionaries/$_pkgname.m2.bz2"
}
