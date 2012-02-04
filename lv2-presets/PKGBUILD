# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lv2-presets
pkgver=2.2
pkgrel=1
pkgdesc="Lv2 Presets extension"
arch=(any)
url="http://lv2plug.in/"
license=('custom:ISC')
groups=('lv2-extensions')
depends=('lv2core>=6.0')
source=("$url/spec/$pkgname-$pkgver.tar.bz2")
md5sums=('2579bd395f3a4f5145a776b690d2caf8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf install --destdir="$pkgdir/"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  head -n 14 ${pkgname/lv2-}.ttl > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
