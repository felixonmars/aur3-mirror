# Maintainer:  <clu>

pkgname=sparskit
pkgver=2.0
pkgrel=3
pkgdesc="A basic tool-kit for sparse matrix computations"
url="http://www-users.cs.umn.edu/~saad/software/SPARSKIT/index.html"
arch=('i686' 'x86_64')
license=('LGPL2')
options=(!strip staticlibs)
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www-users.cs.umn.edu/~saad/software/SPARSKIT/SPARSKIT2.tar.gz)
md5sums=('031e799efbc799b1e31348037562b7a3')


build() {
  cd $srcdir/SPARSKIT2

  make F77=gfortran
}

package() {
  cd $srcdir/SPARSKIT2

  install -m 755 -d "${pkgdir}/usr/lib"
  install -Dm644 libskit.a ${pkgdir}/usr/lib

  mkdir -p $pkgdir/usr/share/doc/sparskit
  install -Dm644 DOC/paper.pdf $pkgdir/usr/share/doc/sparskit
  install -Dm644 DOC/README $pkgdir/usr/share/doc/sparskit
  install -Dm644 DOC/QUICK_REF $pkgdir/usr/share/doc/sparskit

  msg "Documentation is located in: /usr/share/doc/sparskit"
}
