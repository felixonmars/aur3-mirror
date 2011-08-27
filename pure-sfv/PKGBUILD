# Contributor: sh0 <mee@sh0.org>

pkgname='pure-sfv'
pkgver='0.3'
pkgrel=1
pkgdesc='A utility to both test and create .sfv'
url='http://pure-sfv.sourceforge.net/'
arch=('i686' 'x86_64')
license=('GPL')
depends=()
source=("http://downloads.sourceforge.net/pure-sfv/${pkgname}_${pkgver}_src.tar.gz")
md5sums=('2643118c32184c880cd8935173889449')

build() {
	cd "${srcdir}"
	sed -i 's:-O2 -g::;s:-Werror::' Makefile || return 1
	make || return 1
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}" || return 1
	install -D -m644 ReadMe.txt "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/ReadMe.txt" || return 1
}
