# Contributor: Richard Murri <admin@richardmurri.com>
pkgname=vcron
pkgver=2.3
pkgrel=1
pkgdesc="graphical interface to at and cron"
arch=(i686)
url="http://www.linux-kheops.com/pub/vcron/vcronGB.html"
license=('GPL')
depends=(tk at cron)
source=(http://www.linux-kheops.com/pub/vcron/$pkgname-$pkgver.tgz)
md5sums=('008e3191a6bacabd6139125e499f3521')

build() {
  cd "$srcdir"

  # extract files
  install -D usr/local/bin/vcron $pkgdir/usr/bin/vcron
  install -d $pkgdir/usr/lib
  cp -r usr/local/lib/* $pkgdir/usr/lib
}
