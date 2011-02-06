# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

libname=microdia
filename=gui${libname}
pkgname=gui-${libname}-git
pkgver=20090503
pkgrel=1
pkgdesc="A GUI for managing V4L2 Webcam Preferences for Microdia (0c45) webcams"
arch=("any")
url="https://groups.google.com/group/${libname}/msg/02d97178b5a83cb3"
license=("GPL")
depends=("${libname}-git" "gtk2" "python" "python-configobj" "ivtv-utils")
makedepends=("git")
optdepends=("mplayer: to test the Microdia webcam")
#install=${pkgname}.install

source=()
md5sums=()
_gitroot="git://repo.or.cz/${filename}.git"
_gitname="${filename}"

build() {
	cd ${srcdir}

	# Repository
	msg "Connecting to GIT server...."
	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin || return 1
		msg "The local files are updated."
	else
		git clone $_gitroot || return 1
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	# Removals
	rm -rf ${srcdir}/$_gitname-build
	cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
	cd ${srcdir}/$_gitname-build

	# Installation
	python setup.py install --root=${pkgdir} || return 1
	ln -s /usr/share/pyshared/${filename}/MicrodiaV4.xml ${pkgdir}/usr/lib/python2.6/site-packages/${filename}/
	ln -s /usr/share/pyshared/${filename}/MicrodiaV4Header.png ${pkgdir}/usr/lib/python2.6/site-packages/${filename}/
	install -D ${startdir}/extra/${libname}-test ${pkgdir}/usr/bin/${libname}-test
}
