# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: zoulnix <http://goo.gl/HQaP>

pkgname=phash
_pkgname=pHash
pkgver=0.9.6
pkgrel=1
pkgdesc="The open source perceptual hash library."
arch=('i686' 'x86_64')
url="http://www.phash.org/"
license=('GPL')
depends=('cimg>=1.3.0' 'ffmpeg' 'libsamplerate' 'mpg123')
makedepends=()
options=('!libtool')
source=(http://www.phash.org/releases/pHash-${pkgver}.tar.gz)
md5sums=('0572f3cfe2219a5537b78d3c5b78f84c')

build() { 
	cd ${srcdir}/${_pkgname}-${pkgver}

	./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

	make
}

package() {
	cd ${srcdir}/pHash-${pkgver}

	make DESTDIR=${pkgdir} install
}
