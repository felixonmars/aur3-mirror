# Maintainer: Sial <NAME at cpan dot org>

_gitname='powerline-fonts'
pkgname='ttf-anonymous-pro-powerline-git'
pkgver=20130604
pkgrel=1
pkgdesc='Pre-patched and adjusted version for usage with the new Powerline plugin'
arch=('any')
url="https://github.com/Lokaltog/${_gitname}/tree/master/AnonymousPro"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git')
optdepends=('python-powerline-git: The ultimate statusline/prompt utility'
	'python2-powerline-git: The ultimate statusline/prompt utility')
install=${pkgname}.install
source=("git+https://github.com/Lokaltog/${_gitname}")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${_gitname}/AnonymousPro"
	
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
