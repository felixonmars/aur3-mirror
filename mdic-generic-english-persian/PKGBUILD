# Maintainer & Contributor: Alireza Savand <alireza.savand@gmail.com>

pkgname=mdic-generic-english-persian
_pkgname="Generic_English_Persian"
_updict="Dictionaries"
pkgver=1.0
pkgrel=1
pkgdesc="MDic Generic English-Persian dictionary(50259 entries)."
url="http://mdic.gnufolks.org/dictionaries.html"
arch=(any)
license=("GPL3")
depends=("mdic")
install="$pkgname.install"
makedepends=()
source=("http://sourceforge.net/projects/mdic/files/$_updict/$_updict/$_pkgname.m2.bz2")
md5sums=('73d549db8d428c7855fb698d5313c921')

package() {
	cd $srcdir
	mkdir -p "${pkgdir}/usr/lib/mdic/dictionaries/"
	install -Dm644 "$_pkgname.m2.bz2" "${pkgdir}/usr/lib/mdic/dictionaries/$_pkgname.m2.bz2"
}
