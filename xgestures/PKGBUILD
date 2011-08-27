# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xgestures
pkgver=0.4
pkgrel=1
pkgdesc="Gesture recognition program for X11."
arch=('i686')
url="http://www.cs.bgu.ac.il/~tzachar/xgestures.html"
license=('GPL')
depends=('libxtst' 'libxmu' 'libxrender')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('a4e33faf735ffb43bf84b7eb929f50d4')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr/ || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
