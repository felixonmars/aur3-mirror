# Maintainer: Egon Geerardyn <egon.geerardyn@gmail.com>
pkgname=sf-wcalc
pkgver=1.1
pkgrel=2
epoch=0
pkgdesc="A tool for the analysis/synthesis of transmission lines and related components."
arch=('i686' 'x86_64')
url="http://wcalc.sourceforge.net/"
license=('GPL2')
groups=()
depends=(gtk2)
makedepends=('curl')
checkdepends=()
optdepends=()
backup=()
options=(!libtool)
source=("$pkgname-tar.gz::http://sourceforge.net/projects/wcalc/files/wcalc/wcalc-$pkgver/wcalc-$pkgver.tar.gz"
"CoilAWG.patch::http://sourceforge.net/tracker/download.php?group_id=37562&atid=420082&file_id=423708&aid=3410395")
md5sums=('62d41eac2979c1a745e4e4c7045d97c4'
         '7211917ece63f4f2865d96a5b395ccc8')
build() {
  cd "$srcdir/wcalc-$pkgver"
  #sed -i 's/wcalc-1.1_r1/wcalc-1.1/g' ../CoilAWG.patch
  patch -p 1 -R < ../CoilAWG.patch
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
  cd "$srcdir/wcalc-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/wcalc-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
