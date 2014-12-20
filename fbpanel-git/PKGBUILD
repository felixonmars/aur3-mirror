# Maintainer: Alf <naihe2010 [at] 126 [dot] com>

pkgname=fbpanel-git
pkgver=20141218
pkgrel=1
pkgdesc="fbpanel is a lightweight GTK2-based panel for UNIX desktop."
arch=('i686' 'x86_64')
url="https://github.com/naihe2010/fbpanel.git"
license=('GPL')
depends=('gtk2')
makedepends=('git' 'python2')
conflicts=('fbpanel')
source=()
md5sums=()

_gitroot="https://github.com/naihe2010/fbpanel.git"
_gitname="fbpanel"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone -b master $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"

	if [ -d "${srcdir}/${_gitname}-build" ]
	then
		rm -rf "${srcdir}/${_gitname}-build"
	fi

	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	msg "Starting make..."

	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_gitname}-build"
	make DESTDIR=${pkgdir} install
}
