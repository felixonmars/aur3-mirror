# Maintainer: Thomas Ruoff <tomru@ido.cassiopeia.uberspace.de>

pkgname=otf-dejavusansmono-powerline-git
pkgver=20130413
pkgrel=1
pkgdesc="Pre-patched and adjusted version for usage with the new Powerline plugin"
arch=('any')
url='https://github.com/Lokaltog/powerline-fonts/tree/master/DejaVuSansMono'
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
optdepends=('python-powerline-git: The ultimate statusline/prompt utility'
	'python2-powerline-git: The ultimate statusline/prompt utility')
install=${pkgname}.install
source=()
md5sums=('SKIP')

_gitroot='https://github.com/Lokaltog/powerline-fonts'
_gitname='powerline-fonts'

build() {
	cd "$srcdir"

	msg "Connecting to GIT server..."

	if [ -d "${srcdir}/${_gitname}" ]; then
		cd "$_gitname" && git pull origin
		cd "$srcdir"
		msg "The local files are updated."
	else
		git clone --depth=1 "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
}

package() {
	cd "${srcdir}/${_gitname}/DejaVuSansMono"
	
	local font='DejaVu Sans Mono for Powerline.otf'
	install -Dm644 "$font" "${pkgdir}/usr/share/fonts/OTF/$font"
}
