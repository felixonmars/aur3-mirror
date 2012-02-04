# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
pkgname=jaula
pkgver=1.4.0
pkgrel=2
pkgdesc="A C++ JSON reader and writer"
license=('LGPL')
arch=(i686 x86_64)
url="http://morongo.homelinux.net/jaula/"
depends=('gcc-libs')
makedepends=('doxygen' 'texlive-core' 'texlive-bin' 'flex' 'bison' 'gcc')
optdepends=()
source=(http://kent.dl.sourceforge.net/sourceforge/jaula/jaula-1.4.0.tar.bz2)
md5sums=('02ea21bc55d7fdd80e68c66dd0827291')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  export CFLAGS="${CFLAGS} -DEOF=-1"
  export CXXFLAGS="${CXXFLAGS} -DEOF=-1"
  ./configure --prefix /usr --enable-doc-gen || return 1
  make || return 1
  make DESTDIR=${pkgdir} install
}
