# Maintainer: Sial <NAME at cpan dot org>

_gitname='powerline-fonts'
pkgname=otf-ubuntu-mono-powerline-git
pkgver=20130522
pkgrel=1
pkgdesc="Pre-patched and adjusted version for usage with the new Powerline plugin"
arch=('any')
url="https://github.com/Lokaltog/${_gitname}/tree/master/UbuntuMono"
license=('custom:UFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
optdepends=('python-powerline-git: The ultimate statusline/prompt utility'
	'python2-powerline-git: The ultimate statusline/prompt utility')
install=${pkgname}.install
source=("git+https://github.com/Lokaltog/${_gitname}")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${_gitname}/UbuntuMono"
	
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"
	install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
