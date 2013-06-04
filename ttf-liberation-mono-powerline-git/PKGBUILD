# Maintainer: Sial <NAME at cpan dot org>

_gitname='powerline-fonts'
pkgname='ttf-liberation-mono-powerline-git'
pkgver=2.00.1
pkgrel=1
pkgdesc="Pre-patched and adjusted version for usage with the new Powerline plugin"
arch=('any')
url="https://github.com/Lokaltog/${_gitname}/tree/master/LiberationMono"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git')
optdepends=('python-powerline-git: The ultimate statusline/prompt utility'
	'python2-powerline-git: The ultimate statusline/prompt utility')
install=${pkgname}.install
source=("git+https://github.com/Lokaltog/${_gitname}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/LiberationMono"
 cat README.rst | grep '^:Version:' | sed -n 's/^.*: \(.*[0-9]\).*$/\1/p'
}

package() {
	cd "${srcdir}/${_gitname}/LiberationMono"
	
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
