# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid

pkgname=redcar-application-icons
pkgver=0.0.1
pkgrel=1
pkgdesc="Application icons for Redcar."
arch=(any)
url='https://github.com/flaccid/redcar-application-icons'
license=('GPL2')

source=("https://github.com/flaccid/$pkgname/archive/$pkgver.tar.gz")

md5sums=('727e19e1a27fd793d1eff5c3732cbf64')

package() {
  for i in 16 22 24 32 48 128 256; do
    install -Dm 644 "$srcdir/$pkgname-$pkgver/${i}x${i}/apps/redcar.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/redcar.png"
  done
  
  install -Dm 644 "$srcdir/$pkgname-$pkgver/48x48/apps/redcar.png" "$pkgdir/usr/share/pixmaps/redcar.png"
}

# vim:set ts=2 sw=2 et:
