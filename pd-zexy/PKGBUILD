# Maintainer: Dominik Schmidt-Philipp <dsp at tonmaschine dot de>
# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=pd-zexy
pkgver=2.2.4
pkgrel=3
pkgdesc="the swiss army knife for Pd"
arch=('i686' 'x86_64')
url="http://puredata.info/downloads/zexy/"
depends=('pd')
license=('GPL2')
source=(http://puredata.info/downloads/zexy/releases/${pkgver}/zexy-${pkgver}.tar.gz)
md5sums=('91aa2a5969d6167e4027e3666a6158c9')

build() {
	cd ${startdir}/src/zexy-${pkgver}/src
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	  cd ${startdir}/src/zexy-${pkgver}/src
	  pwd
	  make DESTDIR="$pkgdir" install
}