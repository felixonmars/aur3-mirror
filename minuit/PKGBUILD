# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=minuit
pkgver=1.7.9
_pkgver=1_7_9
pkgrel=2
pkgdesc="A physics analysis tool for function minimization (version 1.x)"
arch=('i686' 'x86_64')
url="http://lcgapp.cern.ch/project/cls/work-packages/mathlibs/minuit/"
license=('LGPL')
depends=('gcc-libs')
options=('!libtool')
source=("http://seal.web.cern.ch/seal/minuit/releases/Minuit-${_pkgver}.tar.gz"
        "${pkgname}.patch")
md5sums=('10fd518fc778317fdadbc4ef6f7ce8e4'
         'a17e50fb6c0393c0450af15348b6d500')

build() {
  cd "${srcdir}/Minuit-${_pkgver}"
  patch -Np0 -i ../${pkgname}.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/Minuit-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
