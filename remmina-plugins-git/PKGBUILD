# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=remmina-plugins-git
pkgver=20120104
pkgrel=1
pkgdesc="Remmina remote desktop client plugins - git checkout "
arch=(i686 x86_64)
url="http://remmina.sourceforge.net/"
license=('GPL')
provides=(remmina-plugins)
conflicts=(remmina-plugins)
depends=(remmina-git freerdp-git zlib libjpeg avahi vte libssh libgcrypt libunique)
makedepends=(git cmake intltool pkgconfig gettext libxdmcp)
install=remmina-plugins.install

_gitroot="https://github.com/FreeRDP/Remmina"
_gitname="remmina"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ]; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	msg "GIT checkout done or server timeout"

	msg "Cloning to build directory"
	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

	msg "Starting make..."

	cd "${srcdir}/${_gitname}-build/"

	cmake ./ -DCMAKE_INSTALL_PREFIX=/usr

	cd "remmina-plugins/"
	make
	make DESTDIR=${pkgdir} install
}
