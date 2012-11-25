# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>

pkgname=mdic-longman
_pkgname="longman"
_updict="Dictionaries"
pkgver=1.0
pkgrel=1
pkgdesc="MDic Longman dictionary(43052 entries)."
url="http://mdic.gnufolks.org/dictionaries.html"
arch=(any)
license=("GPL3")
depends=("mdic")
install="$pkgname.install"
makedepends=()
source=("http://sourceforge.net/projects/mdic/files/$_updict/$_updict/$_pkgname.m2.bz2")
md5sums=('cabb3f9f6db4e5c4eaaecb06883913da')

package() {
	cd $srcdir
	mkdir -p "${pkgdir}/usr/lib/mdic/dictionaries/"
	install -Dm644 "$_pkgname.m2.bz2" "${pkgdir}/usr/lib/mdic/dictionaries/$_pkgname.m2.bz2"
}
