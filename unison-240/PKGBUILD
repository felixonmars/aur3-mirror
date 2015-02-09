# $Id$
#Maintainer: jdn06 <jdn06.jdn06 at outlook.fr>

pkgname=unison-240
_pkgname=unison
pkgver=2.40.102
pkgrel=3
pkgdesc='File-synchronization tool (legacy 2.40 version)'
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=('i686' 'x86_64')
license=('GPL2')
optdepends=('gtk2: for gtk2 support')
makedepends=('ocaml' 'lablgtk2' 'imagemagick')
provides=('unison')
conflicts=('unison' 'unison-227' 'unison-232' 'unison-beta')
source=("http://www.cis.upenn.edu/~bcpierce/unison/download/releases/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'desktop')
sha1sums=('5165a1c61a4f323ed0639e8fb891cfa86eb1d463'
          '9dad1737dd8d90e7ee2744a96cf71bd9f802a12a')

options=('!makeflags')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	CFLAGS=""

	for ui in text gtk2; do
		make clean
		make mkProjectInfo 
		make UISTYLE=$ui DEBUGGING=false THREADS=true
		mv unison unison-$ui
	done
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -d "${pkgdir}"/usr/bin
	install -m755 unison-* "${pkgdir}"/usr/bin

	install -d "${pkgdir}"/usr/share/{pixmaps,applications}
	convert win32rc/U.ico[1] "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -m644 ../desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	cd "${pkgdir}"/usr/bin
	ln -s unison-text unison
	ln -s unison-gtk2 unison-x11
	ln -s unison unison-${pkgver%.*}
}
