# Mainteiner: Facundo Bianco (vando) <facundo{at}esdebian{dot}org>
pkgname=('ispell-es')
_pkgname=('espa~nol')
pkgver=1
pkgrel=11
pkgdesc="Spanish dictionary for ispell."
url="http://www.datsi.fi.upm.es/~coes"
depends=('ispell')
provides=('ispell-es')
source=(http://www.datsi.fi.upm.es/~coes/${_pkgname}-${pkgver}.${pkgrel}.tar.gz)
#source=(ftp://ftp.de.debian.org/debian/pool/main/e/espa-nol/espa-nol_1.11.orig.tar.gz)
md5sums=('fc09b58b773a0b62dd1c1307d19259f4')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}.${pkgrel}"
    	make || return 1
        install -Dm755 ${_pkgname}.aff  ${pkgdir}/usr/lib/ispell/ispell-es.aff
  	install -Dm755 ${_pkgname}.hash ${pkgdir}/usr/lib/ispell/ispell-es.hash
}
