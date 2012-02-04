# Maintainer: Hanspeter Portner <agenthp at users dot sf dot net>

pkgname=didgmo
pkgver=0.3.2
pkgrel=2
pkgdesc='Acoustic transmission line modelling of didgeridoo sound characteristics'
arch=(i686 x86_64)
url='http://didgmo.sf.net'
license=('Zlib')
depends=('gcc-libs' 'eina' 'lua' 'fftw' 'libsndfile')
optional=('luajit2')
suggests=('gnuplot')
makedepends=('cmake')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.bz2/download")
md5sums=('f0182be6b7bd5863aa0f0fd344ccbdb1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install COPYING "$pkgdir/usr/share/licenses/$pkgname"
}
