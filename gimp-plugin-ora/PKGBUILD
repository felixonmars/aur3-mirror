# Contributer: N30N <archlinux@alunamation.com>

pkgname="gimp-plugin-ora"
pkgver=20101116
pkgrel=1
pkgdesc="OpenRaster load/save handler"
url="http://create.freedesktop.org/wiki/OpenRaster"
license=("GPL2")
arch=("i686" "x86_64")
depends=("gimp" "python2")
source=("http://gitorious.org/openraster/gimp-plugin-file-ora/blobs/raw/master/file-ora.py")
md5sums=("c89015645d06cab5fa7fff40891c2d71")

_gitroot="git://gitorious.org/openraster/gimp-plugin-file-ora.git"
_gitname="gimp-plugin-file-ora"

build() {
	sed "1s/python$/python2/" -i file-ora.py
	install -D -m755 file-ora.py ${pkgdir}/usr/lib/gimp/2.0/plug-ins/file-ora.py
}

# vim: set noet ff=unix
