# Maintainer: Raphael Proust <raphlalou at gmail dotcom>

pkgname=cols
pkgver=1.0
pkgrel=3
pkgdesc="Pretty Terminal Stuff: ls like columnization and colourization"
url="http://galos.no-ip.org/cols"
arch=('i686' 'x86_64' 'arm')
license=('Unknown')
options=()
depends=()
source=(http://galos.no-ip.org/cols.tar.gz)
md5sums=('e087057f19fc098404f9eba43e28dd19')

build() {
  cd $srcdir/$pkgname

  make clean
  make
}

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/bin
  make DESTDIR=$pkgdir/usr/bin install
}
