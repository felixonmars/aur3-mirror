#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libwfut
pkgver=0.2.3
pkgrel=1
pkgdesc="C++ implementation of the client side of WFUT"
arch=(i686 x86_64)
url="http://worldforge.org/"
license=('LGPL')
depends=('curl' 'libsigc++')
makedepends=('python2' 'swig')
optdepends=('python2: python bindings')
options=(!libtool)
source=("http://downloads.sourceforge.net/sourceforge/worldforge/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed 's|PYTHON=python|PYTHON=python2|' -i py-compile
  for py in python/*.py; do sed 's|bin/python|bin/python2|' -i $py; done

  PYTHON=python2 ./configure --prefix=/usr
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}


md5sums=('b212f840613c9b84a0de86693a7ee4bf')
