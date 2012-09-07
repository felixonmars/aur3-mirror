# Maintainer: brainpower <brainpower@gulli.com>

pkgname=libaccounts-glib
pkgver=1.3
pkgrel=1
pkgdesc="library for single signon"
arch=('i686' 'x86_64')
url="http://accounts-sso.googlecode.com"
license=('LGPL')
depends=('dbus' 'dbus-glib' 'sqlite' 'libxml2')
makedepends=('libtool' 'intltool' 'gobject-introspection' 'check' 'python-gobject' 'python2-gobject')
groups=('unity-webapps')

source=("http://accounts-sso.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
        "py3.patch")
md5sums=('bef1398c7b22ce277e00e08034841507'
         'b5d175f2d445d846ad68e5214708a408')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -Np1 -i "${srcdir}/py3.patch"

	autoreconf -vfi
	PYTHON=python ./configure --prefix=/usr

	make ${MAKEFLAGS}
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	make install DESTDIR="${pkgdir}"

	# Do a python2 install, too?
	PYTHON=python2 ./configure --prefix=/usr
	cd pygobject/ && make install DESTDIR="${pkgdir}" && cd ..

	rm "${pkgdir}"/usr/lib/*.la
	rm "${pkgdir}"/usr/lib/python*/site-packages/gi/overrides/*.pyc
	rm "${pkgdir}"/usr/lib/python*/site-packages/gi/overrides/*.pyo
	rm -r "${pkgdir}/usr/doc"
}
