# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=yap-devel
pkgver=6.3.3
pkgrel=1
pkgdesc="A high-performance Prolog compiler (Development version)"
url="http://www.dcc.fc.up.pt/~vsc/Yap/"
license=("PerlArtistic" "LGPL")
arch=("i686" "x86_64")
makedepends=('texi2html' 'texinfo')
depends=('unixodbc' 'libmariadbclient')
optdepends=('java-runtime-headless: Java Interface Library JPL'
            'lam: MPI LAM-based interface'
            'mpe2: MPE interface'
            'mpich: MPICH based MPI interface')
provides=('yap')
conflicts=('yap')
source=(http://www.dcc.fc.up.pt/~vsc/Yap/yap-${pkgver}.tar.gz)
sha256sums=('aee3b449b1669af07a8291ce6e7fb0a9b35e1343e2ab96fadb1a37552397fa78')

build() {
  cd yap-${pkgver}
  ./configure \
    --prefix=/usr \
    --with-java="${JAVA_HOME}" \
    --enable-threads \
    --enable-dynamic-loading \
    --enable-max-performance \
    --enable-max-memory
  make

  make html
  make pdf
}

package() {
  cd yap-${pkgver}

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install_docs
}
