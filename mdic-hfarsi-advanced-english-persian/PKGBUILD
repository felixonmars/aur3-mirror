# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>

pkgname=mdic-hfarsi-advanced-english-persian
_pkgname="hFarsi_Advanced_English-Persian"
_updict="Dictionaries"
pkgver=1.0
pkgrel=1
pkgdesc="MDic hFarsi Advanced English-Persian dictionary(249642 entries)."
url="http://mdic.gnufolks.org/dictionaries.html"
arch=(any)
license=("GPL3")
depends=("mdic")
install="$pkgname.install"
makedepends=()
source=("http://sourceforge.net/projects/mdic/files/$_updict/$_updict/$_pkgname.m2.bz2")
md5sums=('63e0961104014b39f8a83c311f65bc79')

package() {
	cd $srcdir
	mkdir -p "${pkgdir}/usr/lib/mdic/dictionaries/"
	install -Dm644 "$_pkgname.m2.bz2" "${pkgdir}/usr/lib/mdic/dictionaries/$_pkgname.m2.bz2"
}
