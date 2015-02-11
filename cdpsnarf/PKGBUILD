pkgname=cdpsnarf
pkgver=0.1.6
pkgrel=1
pkgdesc='Network sniffer to extract CDP information'
url='https://github.com/Zapotek/cdpsnarf'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libpcap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zapotek/cdpsnarf/archive/v$pkgver.tar.gz")
md5sums=('07cb6060094bab001f27e6878d01c2de')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -dm755 $pkgdir/usr/bin
  install -m755 cdpsnarf $pkgdir/usr/bin
}

