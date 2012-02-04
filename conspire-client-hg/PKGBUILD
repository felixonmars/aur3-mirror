# Contributor: JD Horelick <jdhore1@gmail.com>
pkgname=conspire-client-hg
pkgver=952
pkgrel=2
pkgdesc="An advanced, lightweight IRC client for UNIX - DEVELOPMENT VERSION"
arch=('i686' 'x86_64')
url="http://www.nenolod.net/conspire"
license=('GPL')
depends=('gtk2' 'libmowgli' 'dbus-glib' 'gnutls' 'python' 'libnotify' 'libsexy')
makedepends=('pkgconfig' 'mercurial')
source=()
md5sums=()

_hgroot=http://hg.atheme.org/
_hgrepo=conspire/
_hgbuild=conspire

build() {
  	cd ${startdir}/src

	if [ -d ${_hgrepo} ]; then
		cd ${startdir}/src/${_hgrepo}
		hg pull -u
	else
		hg clone ${_hgroot}${_hgrepo} || return 1
		cd ${startdir}/src/${_hgbuild}
	fi

	msg "Mercurial checkout done or server timeout"
	msg "Starting make..."

	cp -R ${startdir}/src/${_hgbuild} ${startdir}/src/${_hgbuild}-build
	cd ${startdir}/src/${_hgbuild}-build
        ./autogen.sh
  	./configure --prefix=/usr
  	make || return 1
  	make DESTDIR=$startdir/pkg install || return 1
        rm -rf ${startdir}/src/${_hgbuild}-build
}


