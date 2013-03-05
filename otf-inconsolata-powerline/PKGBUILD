# Maintainer: Sial <NAME at cpan dot org>

pkgname=otf-inconsolata-powerline
pkgver=20130305
pkgrel=1
pkgdesc="Pre-patched and adjusted version for usage with the new Powerline plugin"
arch=('any')
url='https://github.com/Lokaltog/powerline-fonts/tree/master/Inconsolata'
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=("Inconsolata for Powerline.otf"::https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf)
md5sums=('992963d9ef34d73f56f8b58451ed2fc5')

package() {
	local font='Inconsolata for Powerline.otf'
	install -Dm644 "${srcdir}/$font" "${pkgdir}/usr/share/fonts/OTF/$font"
}
