# Maintainer: Marco A Rojas <marquicus at gmail dot com>

pkgname=openchange-svn
_codename=NOMAD
pkgver=0.10
pkgrel=2
pkgdesc="Library for MAPI connectivity with Microsoft Exchange."
arch=('i686' 'x86_64')
url="http://www.openchange.org"
license=('GPL3')
depends=('samba4=4.0.0A15' 'popt' 'libical' 'sqlite3' 'file' 'boost' 'zlib')
makedepends=('ccache' 'python2' 'subversion' 'docbook-xsl' 'libxslt')
options=(!makeflags)
_prefix="/opt/samba4"
_svnroot='http://svnmirror.openchange.org/openchange/trunk'
_svnname='openchange'
source=()
md5sums=()

build() {
  if [ -d "${srcdir}/${_svnname}" ] ; then
    cd ${_svnname} && svn up
  else
    svn co ${_svnroot} ${_svnname}-${pkgver}-${_codename}
  fi

  sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" \
         -e "s|python-config$|python2-config|" \
         -e "s|bin/python$|bin/python2|" \
    $(find ${srcdir}/${_svnname}-${pkgver}-${_codename} -name '*.py')
  sed -i -e "s|/usr/bin/python$|/usr/bin/python2|" \
    $(find ${srcdir}/${_svnname}-${pkgver}-${_codename}/  -type f)
  export PYTHON=/usr/bin/python2
  sed -i -e "s|python-config|python2-config|" \
    $(find ${srcdir}/${_svnname}-${pkgver}-${_codename}/ -name 'configure.ac')

	export PKG_CONFIG_PATH=${_prefix}/lib/pkgconfig:$PKG_CONFIG_PATH
	export BOOST_LIB_SUFFIX="-mt"
	cd ${srcdir}/${_svnname}-${pkgver}-${_codename}
	./autogen.sh
#	export PKG_CONFIG_PATH=${_prefix}/samba/lib/pkgconfig:${_prefix}/lib/pkgconfig:$PKG_CONFIG_PATH
#	export BOOST_LIB_SUFFIX="-mt"
	./configure --prefix=${_prefix}
	make || return 1
}

package() {
	_pyver=`python2 -c 'import sys; print(sys.version[:3])'`

	cd ${srcdir}/${_svnname}-${pkgver}-${_codename}
	make DESTDIR="$pkgdir/" install

	cd ${pkgdir}/${_prefix}/lib/
	ln -s libmapi.so libmapi.so.0

	find ${pkgdir}/${_prefix}/lib/python${_pyver}/site-packages/ -name '*.py' | \
		xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}
