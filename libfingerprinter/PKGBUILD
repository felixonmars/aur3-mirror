# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=libfingerprinter
pkgver=1.6
pkgrel=1
pkgdesc="Last.fm Audio Fingerprint Library"
url="https://bitbucket.org/amrhassan/libfingerprinter"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('fftw')
makedepends=(cmake)
conflicts=("lastfm-fingerprinter-git")
source=("https://bitbucket.org/amrhassan/libfingerprinter/downloads/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('02582bb44a1dbeb547f4d809e498016f')
