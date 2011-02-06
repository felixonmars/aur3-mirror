# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=massifg
pkgver=0.2.2
pkgrel=1
pkgdesc="GTK based visualizer for massif"
arch=(i686 x86_64)
url="http://www.gitorious.org/massifg"
license=('GPLv3')
depends=('gtk2' 'goffice')
source=(http://www.jonnor.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('f36f1e6b0b6743ea10c04b1af9ff80d1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
