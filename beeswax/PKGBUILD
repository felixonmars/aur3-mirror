# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=beeswax
pkgver=0.2.0
pkgrel=2
pkgdesc="an information management system inspired by Lotus Agenda"
arch=('i686' 'x86_64')
url="http://waxandwane.org/beeswax/beeswax.html"
license=('GPL')
depends=('ncurses' 'libxml2' 'e2fsprogs')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        beeswax-0.2.0-wctype.diff)
md5sums=('7675900097f5488fff6bb7b4df56b8d6' \
         'a15a9faf5c77845be7be8095502a02dc')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	patch -Np1 -i ${srcdir}/beeswax-0.2.0-wctype.diff || return 1
	make DESTDIR=${pkgdir} install || return 1
}
