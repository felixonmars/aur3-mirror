# Maintainer: Arslan Atajanov <arslan at gmail dot com>

pkgname=ttf-inconsolata-lgc-git
pkgver=20130323
pkgrel=1
pkgdesc="Inconsolata font with Cyrillic (Russian) alphabet."
arch=('any')
url='https://drrc@bitbucket.org/drrc/inconsolata-lgc.git'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=${pkgname}.install
source=()
md5sums=('SKIP')

_gitroot='https://bitbucket.org/drrc/inconsolata-lgc'
_gitname='Inconsolata-LGC'

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
	
	local font='inconsolatalgc.ttf'
	install -Dm644 "$font" "${pkgdir}/usr/share/fonts/OTF/$font"
}
