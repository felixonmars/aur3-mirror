# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=python2-fann
pkgver=2.1.0beta
pkgrel=1
pkgdesc='Python binding for Fast Artificial Neural Network Library'
arch=('i686' 'x86_64')
url='http://leenissen.dk/fann/'
license=('GPL')
depends=('python2')
makedepends=('swig')
source=("http://downloads.sourceforge.net/sourceforge/fann/fann-${pkgver}.zip"
        "fann-2.1.0beta-shared-libs.patch")
md5sums=('9c53d96ce415c927cb97b8f9de2ea881'
         '18d1b10c94cbed4f3fe708e1b06b38d1')

build() {
  cd fann-${pkgver/beta}

  patch -Np1 -i ${srcdir}/fann-2.1.0beta-shared-libs.patch

  sed -i 's/PYTHON=python/&2/' python/Makefile

  make -C python install ROOT=${pkgdir}
}
