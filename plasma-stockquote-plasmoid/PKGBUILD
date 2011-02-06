# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=plasma-stockquote-plasmoid
pkgver=2.1
pkgrel=3
pkgdesc="Displays stock quotes on the desktop pulled from the Yahoo servers."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=90695"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
install=stockquote.install
source=("http://www.kde-look.org/CONTENT/content-files/90695-plasma_stock_quote-$pkgver.tar.bz2")
md5sums=('ec2099065da1b61bcc8d6c435b87ca79')

build() {
  cd "$srcdir/plasma_stock_quote-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/plasma_stock_quote-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
