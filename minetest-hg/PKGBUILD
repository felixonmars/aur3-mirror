_name=minetest
name=${_name}
pkgname=${_name}-hg
pkgver=1024
pkgrel=1
pkgdesc="An Infiniminer/Minecraft inspired game, mercurial version."
arch=('i686' 'x86_64')
url="http://celeron.55.lt/~celeron55/minetest/"
license=('GPL')
makedepends=('mercurial' 'cmake' 'irrlicht' 'libx11' 'mesa' 'libjpeg' 'bzip2' 'libpng' 'zlib')
depends=('libx11' 'libjpeg' 'bzip2' 'libpng' 'zlib')
conflicts=('minetest')
md5sums=() #generate with 'makepkg -g'

_hgrepo="$_name"
_hgroot="https://bitbucket.org/celeron55"


build() {
	cd $srcdir
	msg "Connecting to hg server..."
	if [[ -d "$_hgrepo/.hg" ]]; then
		msg "pull"
		( cd $_hgrepo && hg pull -u )
	else
		msg "clone"
		hg clone "${_hgroot}/${_hgrepo}"
	fi
	cd "${_hgrepo}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make DESTDIR=${pkgdir} install
}
