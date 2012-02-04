# Contributor: Marcel Wysocki <maci@satgnu.net>
# Maintainer: Marcel Wysocki <maci@satgnu.net>

pkgname=gdynagen
pkgver=0.1.4
pkgrel=1
pkgdesc="gdynagen is a frontend to Dynamips and Dynagen."
arch=('i686' 'x86_64')
url="http://gdynagen.sourceforge.net"
license=('GPL')
depends=('dynagen' 'python' 'pygtk')
makedepends=('sed')
source=(http://downloads.sourceforge.net/gdynagen/${pkgname}-${pkgver}.tar.gz)
md5sums=('6a5ef897f82abc28d3749d18c1241d69')

build() {
  cd $startdir/src/$pkgname-$pkgver
  rm README NEWS

# Fix binary path
  sed -i 's@./dynamips@dynamips@g' gdynagen
  sed -i 's@./dynagen@dynagen@g' gdynagen
  sed -i 's@gdynagen.glade@/usr/share/gdynagen/gdynagen.glade@g' gdynagen

  mkdir -p $startdir/pkg/usr/share/gdynagen
  mkdir -p $startdir/pkg/usr/bin

  mv * $startdir/pkg/usr/share/gdynagen
  cd $startdir/pkg/usr/bin
  ln -s ../share/gdynagen/gdynagen


}
