# pykickstart
# Maintainer: Fernando M <f[at]beford.net>
# Contributor: Ivo Benner <ivo.benner[at]web.de>

pkgname=pykickstart-git
pkgver=20110106
pkgrel=1
pkgdesc="A python library that is used for reading and writing kickstart files"
arch=('i686' 'x86_64')
url="http://fedoraproject.org/wiki/Pykickstart"
license=('GPL2')
depends=('python2')
makedepends=('git')
conflicts=()
replaces=()
backup=()
options=()
source=(install.patch)
md5sums=('cdf686f20a9bdb72995465b6a6c0901a')

_gitroot="git://git.fedorahosted.org/git/pykickstart.git"
_gitname="pykickstart"

build() {
	cd ${srcdir}
	msg 'Connecting to GIT server....'

	if [ -d ${_gitname} ] ; then
  		cd ${_gitname} && git pull origin
		msg 'The local files are updated.'
	else
		git clone ${_gitroot} ${_gitname}
		cd ${_gitname}
	fi

	msg 'GIT checkout done or server timeout'

	msg 'Patching install paths in po makefile...'
	cd po
	patch < ${srcdir}/install.patch
	cd ..

	msg 'Patching for python2'
	
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find ${srcdir} -name '*.py')
    
    sed -i -e "s/python setup/python2 setup/" ${srcdir}/${_gitname}/Makefile
    
	msg 'Starting make...'
	    
	make || return 1
#	make DESTDIR=${pkgdir} install || return 1
}

package(){
	cd ${srcdir}/${_gitname}
	mkdir -p ${pkgdir}/usr/bin
	make DESTDIR=${pkgdir} install
}
