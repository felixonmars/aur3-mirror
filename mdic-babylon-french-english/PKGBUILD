# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>

pkgname=mdic-babylon-french-english
_pkgname="Babylon_French_English"
_updict="Dictionaries"
pkgver=1.0
pkgrel=1
pkgdesc="MDic Babylon French-English dictionary(84524 entries)."
url="http://mdic.gnufolks.org/dictionaries.html"
arch=(any)
license=("GPL3")
depends=("mdic")
install="$pkgname.install"
makedepends=()
source=("http://sourceforge.net/projects/mdic/files/$_updict/$_updict/$_pkgname.m2.bz2")
md5sums=('363f36573b6ab1ec5578f5e325e19459')

package() {
	cd $srcdir
	mkdir -p "${pkgdir}/usr/lib/mdic/dictionaries/"
	install -Dm644 "$_pkgname.m2.bz2" "${pkgdir}/usr/lib/mdic/dictionaries/$_pkgname.m2.bz2"
}
