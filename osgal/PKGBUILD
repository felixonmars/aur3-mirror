# Contributor: kumyco <kumyco@kh.nu>
pkgname=osgal
pkgver=0.6.1
pkgrel=1
pkgdesc="Handles 3d spatial sound in an openscenegraph environment."
url="http://www.vrlab.umu.se/research/osgAL/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('openscenegraph')
provides=('openalpp')
makedepends=('pkgconfig')
options=(!libtool)
source=(http://sourceforge.net/projects/${pkgname}/files/osgAL/${pkgname}-${pkgver}.tar.gz/download)

md5sums=('94adc3997ec67da05193084af689b22a')
sha1sums=('7eed580801a687a1e62d59f0ebfcdb68315ee959')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
