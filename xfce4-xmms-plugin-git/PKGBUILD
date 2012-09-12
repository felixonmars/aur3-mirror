# $Id$
# Contributor: Morgan Howe <mthowe@gmail.com>

_pkgname=xfce4-xmms-plugin
pkgname=${_pkgname}-git
pkgver=20120912
pkgrel=1
pkgdesc="An xmms plugin for the Xfce4 panel"
arch=(i686 x86_64)
license=('GPL')
url="http://git.xfce.org/panel-plugins/${_pkgname}/"
groups=('xfce4-goodies')
depends=('xfce4-panel>=4.4' 'xmms')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools')
provides=("${_pkgname}")
options=('!libtool')
conflicts=('xfce4-xmms-plugin')
md5sums=()
install=${_pkgname}.install


_gitroot="git://git.xfce.org/panel-plugins/${_pkgname}"
_gitname="${_pkgname}"

build() {
	cd ${srcdir}
	msg "Connecting to xfce.org GIT server...."

	if [ -d ${srcdir}/${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Creating build directory"
					         
	if [ -d ${srcdir}/${_gitname}-build ]; then rm -rf ${srcdir}/${_gitname}-build; fi
		cp -R ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

		msg "Starting make..."
		cd ${srcdir}/${_gitname}-build
						         
		./autogen.sh --prefix=/usr \
			--sysconfdir=/etc \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--disable-static \
			--disable-debug
							 	
		make -j1
}

package() {
	cd ${srcdir}/${_gitname}-build
	make DESTDIR=${pkgdir} install
}
