pkgname=ffpoth
pkgver=20120117
pkgrel=1
pkgdesc="ffmpeg poly thumbnail - a movie thumbnailer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ffmpeg')
url="http://code.google.com/p/ffpoth/"
source=("http://ffpoth.googlecode.com/files/ffpoth-${pkgver}.tar.gz")
md5sums=('ced80b43f475a2b78d13c1c74e0564b7')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	make || return 1
	DESTDIR=${pkgdir} make install
}
