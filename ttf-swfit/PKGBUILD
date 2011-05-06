# Contributor: sidious <miste78@web.de>
# Maintainer: neurolysis <cdown.uk@gmail.com>
# github.com/cdown/aur-packages.git

pkgname='ttf-swfit'
pkgver='1.0'
pkgrel='3'
pkgdesc="Pixel/LED fonts designed for use with Flash."
arch=('any')
url="http://www.caoimh.com/flash/FontViewer/fonts/"
license=('GPL')
groups=('x11')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install='ttf.install'
source=('http://www.caoimh.com/flash/FontViewer/fonts/swfit.zip'
        'http://www.caoimh.com/flash/FontViewer/fonts/swfit2.zip'
        'http://www.caoimh.com/flash/FontViewer/fonts/swfit3.zip')
# Sadly bsdtar seems to garble them, so we'll use unzip.
noextract=('swfit.zip'
           'swfit2.zip'
		   'swfit3.zip')
md5sums=('28a3d22d52bd55d6236ae7a05af5e816'
         '14a2f2e2f1c3ef0e464780e00008c9eb'
         '5f2fe1835918a14efa150428d7a8c698')

build() {
	# Change to ${srcdir} and unzip
	cd "${srcdir}"
	unzip -p swfit.zip > swfit_v01.ttf
	unzip -p swfit2.zip > swfit_v02.ttf
	unzip -p swfit3.zip > swfit_v03.ttf

	# Install fonts to packaging directory
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "${srcdir}/swfit_v01.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install -m644 "${srcdir}/swfit_v02.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install -m644 "${srcdir}/swfit_v03.ttf" "${pkgdir}/usr/share/fonts/TTF/"
}
