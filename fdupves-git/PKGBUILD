# Maintainer: Alf <naihe2010 [at] 126 [dot] org>

pkgname=fdupves-git
pkgver=20130225
pkgrel=1
pkgdesc="fdupves - find you duplicate video/image"
arch=('i686' 'x86_64')
url="http://github.com/naihe2010/fdupves/"
license=('GPL')
depends=('gtk2' 'ffmpeg')
makedepends=('git' 'cmake')
conflicts=('fdupves')
source=()
md5sums=()

_gitroot="https://github.com/naihe2010/fdupves.git"
_gitname="fdupves"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
	
	msg "GIT checkout done or server timeout"

	if [ -d "${srcdir}/${_gitname}-build" ]
	then
		rm -rf "${srcdir}/${_gitname}-build"
	fi

	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"
	
	msg "Starting make..."

	mkdir -p build
	cd build

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package()
{
	cd "${srcdir}/${_gitname}-build"/build
	make DESTDIR=${pkgdir} install
}
