# Maintainer: Thar <mailbox.tec@gmail.com>
# Contributor: Hubert Bielenia <mailbox.tec@gmail.com>

pkgname=xcruiser
pkgver=0.30
pkgrel=4
pkgdesc="A 3D filesystem visualisation tool."
arch=(i686)
url="http://xcruiser.sourceforge.net/"
license=('GPL')
groups=
provides=
depends=('libxaw')
makedepends=('imake')
source=(http://sourceforge.net/projects/xcruiser/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('e57f03ec811c7d47b8713bbfafff088c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  xmkmf -a
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -r $startdir/pkg/usr/lib
}
