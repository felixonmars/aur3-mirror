# Maintainer: Greg Maslov <maslov@cs.unc.edu>
pkgname=gibbslda
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="A C/C++ implementation of Latent Dirichlet Allocation (LDA) using Gibbs Sampling."
arch=('i686' 'x86_64')
url="http://gibbslda.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "http://downloads.sourceforge.net/project/gibbslda/GibbsLDA++/${pkgver}/GibbsLDA++-${pkgver}.tar.gz"
  'stdio-stdlib.patch')
noextract=()
md5sums=('d87d35be6dc8b37afc515f6237ba2ccb'
         '5289e633a9b7bcbc0c9c6f79b270d303')


build() {
  cd "$srcdir/GibbsLDA++-$pkgver"
  patch -p1 -i "$srcdir/stdio-stdlib.patch"
  make clean
  make
}

package() {
  cd "$srcdir/GibbsLDA++-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp src/lda "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
