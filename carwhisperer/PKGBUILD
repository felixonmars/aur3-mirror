# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=carwhisperer
pkgver=0.2
pkgrel=1
pkgdesc="Exploits bluetooth audio connections with standardized PIN passkeys"
arch=('i686' 'x86_64')
url="http://trifinite.org/trifinite_stuff_carwhisperer.html"
license=('GPL')
depends=('bluez' 'perl')
source=("http://trifinite.org/Downloads/$pkgname-$pkgver.tar.gz")
md5sums=('ef3b658c7b8a5b255276b71a2151d356')

build() {
 cd "$srcdir/$pkgname-$pkgver"
 make
}

package() {
 for file in carwhisperer cw_pin.pl cw_scanner; do
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$file" "$pkgdir/usr/bin/$file"
 done

 for file in in.raw out.raw test.raw message.raw hcid.conf README; do
  install -Dm 644 "$srcdir/$pkgname-$pkgver/$file" "$pkgdir/usr/share/$pkgname/$file"
 done
}
