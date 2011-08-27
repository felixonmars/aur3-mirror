# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: oslik <oslik@mail.ru>

pkgname=udav
pkgver=0.7.1.2
pkgrel=1
pkgdesc="Cross-platform program for data arrays visualization based on MathGL library"
arch=('i686' 'x86_64')
url="http://udav.sourceforge.net"
license=('GPL')
depends=('mathgl>=1.10' 'hdf5')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-qt4/$pkgname%20${pkgver%.*}/$pkgname-$pkgver.tar.gz")
md5sums=('13db0bce31406a50a4ec5b0995f17387')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix prefix
  sed -i "s|/local||g" `grep -Erl "/local" .`

  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
