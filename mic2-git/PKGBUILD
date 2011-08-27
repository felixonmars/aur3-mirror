# Maintainer: Fernando M <f[at]beford.net>
# Contributor: Ivo Benner <ivo.benner[at]web.de>

pkgname=mic2-git
pkgver=20110417
pkgrel=1
pkgdesc="MeeGo Image Creator - GIT"
arch=('i686' 'x86_64')
url="http://meego.gitorious.org/meego-developer-tools/image-creator"
license=('GPL2')
depends=('yum>=3.2.27' 'multipath-tools>=0.4.8' 'parted>=2.2' 'syslinux>=3.85' 'isomd5sum>=1.0.4' 'zlib>=1.2.4' 'python2' 'pykickstart-git' 'squashfs-tools>=4.0' 'cpio>=2.0' 'dbus-python')
makedepends=('git' 'python2')
optdepends=('qemu-arm-static: To create ARM images (Pandaboard, Beagleboard, N900, etc.)')
conflicts=(moblin-image-creator-2 mic2)
replaces=()
backup=()
options=()
source=()
md5sums=()

#### no _gitroot/_gitname is used here to prevent automatic pkgver
# 
#githead=${pkgver}
_gitroot="git://gitorious.org/meego-developer-tools/image-creator.git"
_gitname="image-creator"

build() {
	cd ${srcdir}
	msg 'Connecting to GIT server....'

	if [ -d ${_gitname} ] ; then
  		cd ${_gitname}
		git pull origin -f
		git clean -f
	else
		git clone ${_gitroot} ${_gitname}
		cd ${_gitname}
	fi
		
	msg 'GIT checkout done or server timeout'

	msg 'Patching python2 shebangs'

	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"  $(find ${srcdir} -name '*.py')

	msg 'Patching Makefile'
	
	sed -i -e "s|python setup.py|python2 setup.py|" ${srcdir}/${_gitname}/Makefile

	msg 'Starting make...'
	   
	make || return 1

}

package(){
	cd ${srcdir}/${_gitname}
	mkdir -p ${pkgdir}/usr/bin
	make DESTDIR=${pkgdir} install
}
