# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=alock-svn
pkgver=94
pkgrel=3
pkgdesc="Minimal (transparent) screenlocker for X, formerly based on xtrlock"
arch=('i686' 'x86_64')
url="http://code.google.com/p/alock/"
license=('MIT')
depends=('pam' 'imlib2' 'libxcursor' 'libxpm')
makedepends=('gcc' 'make')
source=(http://alock.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2 nodocs.patch)
md5sums=('8a335bccc0543b14d408d761dce09228'
         '38191cea18fe934a9ff6cddb31fb6ef6')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	patch -p1 -i ${srcdir}/nodocs.patch
	./configure --prefix /usr --with-xrender --with-xcursor --with-imlib2 --with-xpm --with-pam --with-hash
	make DESTDIR=${pkgdir} install
	install -m 644 -D ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/alock-svn/LICENSE.txt
}

