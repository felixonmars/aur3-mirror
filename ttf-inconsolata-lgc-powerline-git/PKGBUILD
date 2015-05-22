# Maintainer: Nikolay Zinov <nzinov@gmail.com>

pkgname=ttf-inconsolata-lgc-powerline-git
pkgver=20150521
pkgrel=1
pkgdesc="Inconsolata font with Cyrillic (Russian) alphabet with added gliphs for Powerline."
arch=('any')
url='https://github.com/Gonzih/inconsolata-lgc-for-powerline.git'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=${pkgname}.install
source=()
md5sums=()

_gitroot='https://github.com/Gonzih/inconsolata-lgc-for-powerline'
_gitname='Inconsolata-LGC-For-Powerline'

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
	cd "${srcdir}/${_gitname}/"
	
	local font='Inconsolata LGC for Powerline.ttf'
	install -Dm755 "$font" "${pkgdir}/usr/share/fonts/TTF/$font"
}
