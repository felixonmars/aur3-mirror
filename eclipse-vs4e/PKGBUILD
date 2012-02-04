# Maintainer: Igor Dejanovic <igor.dejanovic (at) gmail.com>
# Contributor: Igor Dejanovic <igor.dejanovic (at) gmail.com>

pkgname=eclipse-vs4e
pkgver=0.9.12
_build=I20090527-2200
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Visual Swing GUI designer for Eclipse"
license=('EPL')
url="http://code.google.com/p/visualswing4eclipse/"
depends=('eclipse')
source=("http://visualswing4eclipse.googlecode.com/files/vs4e_${pkgver}.${_build}.zip")
md5sums=('f08a80ed129c3084da96cdef39a49861')
         
build() {
	install -m755 -d ${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse/plugins
	install -m644 ${srcdir}/plugins/* \
	${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse/plugins/
	
}


