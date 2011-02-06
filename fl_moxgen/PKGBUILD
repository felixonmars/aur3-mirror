# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=fl_moxgen
pkgver=0.05
pkgrel=1
pkgdesc="A program to compute the dimensions of a Moxon Rectangle antenna given the desired frequency and the wire diameter. Fl_MoxGen has export to PDF."
arch=('i686' 'x86_64')
url="http://home.comcast.net/~andystewart/moxon_sw.html"
license=('GPL')
changelog=CHANGELOG
depends=('gcc-libs' 'fltk' 'libharu')
source=(http://downloads.sourceforge.net/flmoxgen/Fl_MoxGen-${pkgver}.tar.gz
		${pkgname}.desktop page-size.patch)

_bindir=/usr/bin
_sharedir=/usr/share/${pkgname}
_haruinc=/usr/include

build() {
	cd ${srcdir}

	patch -p1 < page-size.patch

	cd Fl_MoxGen-${pkgver}

	make BINDIR=${_bindir} SHAREDIR=${_sharedir} LIBHARU_INC=${_haruinc}
}

package() {
	mkdir -p ${pkgdir}/${_bindir} ${pkgdir}/${_sharedir}

	cd ${srcdir}/Fl_MoxGen-${pkgver}

	install -m755 fl_moxgen ${pkgdir}/${_bindir}
	install -m644 moxgen.png ${pkgdir}/${_sharedir}
	install -D -m644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

md5sums=('8d05aece623749fd0448213fe3eed7f6'
         'ef90e1b730057d7074f70ecfacac028b'
         '0501b98a10e22537afe553b131bb98c4')
sha256sums=('19271c51438d6762c58b498fcd8b9293295b1f7497f3c52d3635a8710818ba20'
            'f3fea2c601cc65c5f1cb655c2be88610a50b0d9288008d0ba5b498bfd2cd9fb4'
            '755628d14bae6dec78bb36e776becb48c2a1f97e00bf9947a4a939bdc2356922')
