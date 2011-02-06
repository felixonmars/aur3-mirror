#!/usr/bin/makepkg

# Contributer: N30N <archlinux@alunamation.com>
# Contributer: tm3da <me@tm3da.eu>

pkgname="ramen-svn"
pkgver=109
pkgrel=1
pkgdesc="A node based video compositor"
url="http://ramenhdr.sourceforge.net/"
license=("GPL2")
arch=("i686" "x86_64")
provides=("ramen")
replaces=("ramenhdr")
depends=("libgl" \
	"glew" \
	"boost>=1.42" \
	"intel-tbb" \
	"qt" \
	"ilmbase" \
	"openexr" \
	"fftw-threads" \
	"libpng" \
	"libjpeg" \
	"libtiff" \
	"google-glog")
makedepends=("cmake" "subversion")

_svntrunk="https://ramenhdr.svn.sourceforge.net/svnroot/ramenhdr/trunk"
_svnmod="ramen"

build() {
	cd ${srcdir}
	msg "Connecting to Ramen SVN server......."
	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn update -r ${pkgver}) || return 1
		rm -rf ${srcdir}/${_svnmod}-build
	else
		svn co ${_svntrunk} ${_svnmod} --config-dir ./ -r ${pkgver} || return 1
	fi

	cp -rf ${_svnmod} ${_svnmod}-build
	mkdir ${_svnmod}-build/bin
	cd ${_svnmod}-build/bin

	msg "Starting build process."
	cmake -DCMAKE_BUILD_TYPE=Release ../ || return 1
	make || return 1
	make DESTDIR=${pkgdir} install
}

# vim: set noet ff=unix:
