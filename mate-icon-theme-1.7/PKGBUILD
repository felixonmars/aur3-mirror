# Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>
pkgname=mate-icon-theme-1.7
pkgver=1.7.0
pkgrel=2
pkgdesc="MATE icon theme"
arch=('any')
license=('GPL')
depends=('hicolor-icon-theme'  'gtk-update-icon-cache')
replaces=(mate-icon-theme)
conflicts=(mate-icon-theme)
provides=('mate-icon-theme=1.7.0')
makedepends=('intltool' 'icon-naming-utils')
url="http://pub.mate-desktop.org/releases/1.7/"
groups=('mate')
source=()
sha256sums=()
install=mate-icon-theme.install

_gitroot=git://github.com/mate-desktop/mate-icon-theme.git
_gitname=mate-icon-theme

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	
    ./autogen.sh --prefix=/usr || return 1
    make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"
	
    make DESTDIR="${pkgdir}" install
    #don't include icon cache
    rm -f  "${pkgdir}/usr/share/icons/mate/icon-theme.cache"
}
