# $Id$
# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Radim Hvizdák <hvizdakr at gmail dot com>

pkgname=ibus-hangul-3beol
_pkgname=ibus-hangul
pkgver=1.3.2
pkgrel=1
# pkgdesc='Korean input engine for IBus'
arch=('i686' 'x86_64')
url='http://ibus.googlecode.com'
license=('GPL')
# depends=('ibus' 'libhangul')
makedepends=('intltool')
source=(http://ibus.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz
			ibus-1.4.0.patch
			python.patch
			)
md5sums=('b8132e8b11afadd803b2602c63294da5'
         'ecb405489ed1be73407120b622a21068'
         '1ad46c46ed338e46265619f5450775b3')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/ibus-1.4.0.patch"
	patch -p1 -i "${srcdir}/python.patch"
	
	export PYTHON=python2
	
	./configure --prefix=/usr --libexecdir=/usr/lib/ibus

	make
}

package_ibus-hangul-3beol() {
	pkgdesc='Korean input engine for IBus'
	depends=('ibus' 'libhangul')
	provides=('ibus-hangul')
	conflicts=('ibus-hangul')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make NO_INDEX=true DESTDIR="${pkgdir}" install
}
