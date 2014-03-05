# Maintainer: Vianney Bouchaud <v.aur@bouchaud.org >
pkgname='gsmlib-git'
pkgver=20140304
pkgrel=1
pkgdesc="gsm-utils: GSM mobile phone access applications"
url="https://github.com/vbouchaud/gsmlib"
arch=('any')
license=('LGPL')
makedepends=('git' 'pkg-config' 'glib2')

_gitroot='git://github.com/vbouchaud/gsmlib.git'
_gitname='gsmlib'
_builddir=${_gitname}-build

build() {
	   cd ${srcdir}

	   msg 'Connecting to GIT server...'

	   if [ -d ${_builddir} ]; then
	   	    msg 'Cleaning previous build...'
           	    rm -rf ${_builddir}
	   fi

	   git clone ${_gitroot} ${_builddir}

       	   msg 'GIT checkout done or server timeout.'

       	   cd ${_builddir}
       	   msg 'Starting configure'

       	   ./configure

       	   msg 'Starting make'

       	   make
}

package () {
    cd "${srcdir}/${_builddir}"
    make DESTDIR="$pkgdir" install
}
