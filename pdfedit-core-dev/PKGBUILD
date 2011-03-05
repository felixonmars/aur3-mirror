#Contributor: twa022 <twa022 at gmail dot com>

_pkgname=pdfedit
pkgname=${_pkgname}-core-dev
pkgver=0.4.5
pkgrel=1
pkgdesc='pdfedit core development files'
arch=('i686' 'x86_64')
url='http://pdfedit.petricek.net/index_e.html'
license=('GPL')
depends=('t1lib' 'gsfonts')
makedepends=('boost' 'doxygen')
source=(http://downloads.sourceforge.net/pdfedit/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('80502ee7f08cdfb867ffdaa92d160a23')
options=(!docs !libtool)

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	sed -i 's:/usr/share/fonts/type1/gsfonts:/usr/share/fonts/Type1:' src/xpdf/xpdf/GlobalParams.cc || return 1
	./configure --prefix=/usr --enable-pdfedit-core-dev --disable-gui 
	make || return 1
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make INSTALL_ROOT=${pkgdir} install
}
