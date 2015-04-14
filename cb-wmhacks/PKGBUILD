# Maintainer:  Víctor Quiroga <masterquiroga@ciencias.unam.mx>
pkgname=cb-wmhacks
pkgver=0.06
pkgrel=1
pkgdesc="Python2 script for adding hot corners and aero style window snapping to a WM or DE. Written originally for CrunchBang Linux and intended for Openbox by Philip Newborough and patched for correct Python2 functionality by jpope777"
url="https://github.com/corenominal/cb-wmhacks"
license=('custom:"WTFPL"')
arch=('any')
depends=('wmctrl' 'python2-xlib' 'xdotool>=2.20110530')
makedepends=('git')
provides=('cb-hotcorners' 'cb-aerosnap')

_gitroot="https://github.com/jpope777/cb-wmhacks.git"
_gitname="cb-wmhacks"

# Because the sources are not static, skip Git checksum:
#md5sums=('SKIP')

# see also https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
prepare() {
	# Git
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"

	msg "Starting make..."
	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}


package() {
	cd "$srcdir/$_gitname-build"
	# Create pkgdir folders
	install -d $pkgdir/usr/bin
	# Install
	cp -r cb-aerosnap $pkgdir/usr/bin/cb-aerosnap
	cp -r cb-hotcorners $pkgdir/usr/bin/cb-hotcorners
}
