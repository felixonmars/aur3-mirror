# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: bender02 at gmx dot com

pkgname=dvtm-nomouse
_pkgname=dvtm
pkgver=0.9
pkgrel=1
pkgdesc='Dynamic virtual terminal manager, with mouse support disabled.'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/dvtm/'
license=('MIT')
depends=('ncurses')
provides=(dvtm)
conflicts=(dvtm)
source=("http://www.brain-dump.org/projects/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'config.h')
md5sums=('7de1103abb0ca410f7250cf89f019a38'
         '5ce7d69f0c55e425164d4448e411a5b5')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cp "${srcdir}/config.h" .
	sed -i 's/CFLAGS =/CFLAGS +=/' config.mk

	make clean
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
