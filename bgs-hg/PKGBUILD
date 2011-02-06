# Contributer: Paride Legovini <legovini@spiro.fisica.unipd.it>

pkgname="bgs-hg"
pkgver=39
pkgrel=1
pkgdesc="Imlib2 based, Xinerama/Xrandr-aware minimalist background setter (last hg pull)"
url="http://s01.de/~tox/index.cgi/proj_bgs"
license=("MIT")
arch=("i686" "x86_64")
depends=("libx11" "libxinerama" "imlib2")
makedepends=("mercurial")
optdepends=()
conflicts=("bgs")
provides=("bgs")
source=()
md5sums=()

_hgroot="http://s01.de/~tox/hg"
_hgrepo="bgs"

build() {
	cd ${srcdir}

	# update the repo, else clone a new one
	if [ -d ${_hgrepo} ]; then
		cd ${_hgrepo}
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd ${_hgrepo}
	fi

	# add the correct settings to config.mk
	sed -e "s|^\(\s*PREFIX =\).*|\1 /usr|" -i config.mk

	msg "Starting build process."
	make || return 1
	make DESTDIR=${pkgdir} install
}
