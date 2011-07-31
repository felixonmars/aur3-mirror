# Maintainer: Christian Autermann <christian@autermann.org>

pkgname='plymouth-theme-xbmc-logo-git'
_theme='xbmc-logo'
pkgver=20110731
pkgrel=1
pkgdesc='Plymouth theme featuring the XBMC logo'
arch=('any')
url='http://wiki.xbmc.org/?title=XBMC_Live'
license=('GPL')
depends=('plymouth')
makedepends=('git')
options=(!strip)

_gitroot="https://github.com/xbmc/xbmc-live.git"
_gitname="xbmc-live"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"

	rm -rf "${srcdir}/${_gitname}-build"
	git clone "$srcdir/$_gitname" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"
	sed -e "s|/lib/plymouth/|/usr/share/plymouth/|g" \
		-i "PlymouthThemes/${pkgname%-git}/lib/plymouth/themes/${_theme}/${_theme}.plymouth" 
}


package() {
	cd "${srcdir}/${_gitname}-build/PlymouthThemes/${pkgname%-git}/lib/plymouth/themes/${_theme}"
	install -m755 -d "${pkgdir}/usr/share/plymouth/themes/${_theme}"
	install -m644 -t "${pkgdir}/usr/share/plymouth/themes/${_theme}" * 
}

# vim: set ts=2 sw=2 ft=sh noet:
