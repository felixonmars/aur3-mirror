# $Id$
# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>

pkgname=ttf-xits
pkgver=1.108
pkgrel=1
pkgdesc="OpenType implementation of STIX fonts with math support"
arch=('any')
url="https://github.com/khaledhosny/xits-math"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
install=ttf-xits.install
source=(https://github.com/khaledhosny/xits-math/tarball/v${pkgver})
md5sums=('859a04967e9a12c03ba248f70ca60c17')

package() {
	cd "$srcdir"/khaledhosny-xits-math-*
	install -dm755 "${pkgdir}"/usr/share/fonts/OTF
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF

	install -Dm644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
	install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
	install -m644 documentation/user-guide.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"
}
