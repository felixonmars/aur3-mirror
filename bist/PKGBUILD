# Maintainer: TDY <tdy@gmx.com>

pkgname=bist
pkgver=0.5.1
pkgrel=1
pkgdesc="A chemical drawing tool"
arch=('i686' 'x86_64')
url="http://www.autistici.org/interzona/index.php?mod=03_Bist"
license=('GPL3')
depends=('curl' 'fltk>=1.1.7' 'gsl' 'libxpm' 'openbabel>=2.0' 'pango')
makedepends=('pkgconfig')
source=(http://www.autistici.org/interzona/ftrack.php?url=sections/06_Download/bist_$pkgver.tar.gz)
md5sums=('992ef94965f56ba6cad4a367fa91469b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" LIB_DIR="$pkgdir/usr/lib" install
}
