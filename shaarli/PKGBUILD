# Maintainer: Robin Hahling <robin.hahling@gw-computing.net>
# Contributor: Kevin Gillieron <kevin.gillieron@gw-computing.net>
pkgname=shaarli
pkgver=0.0.41beta
pkgrel=2
pkgdesc='A delicious clone, written in PHP and meant to be self-hosted.'
arch=('any')
url="http://sebsauvage.net/wiki/doku.php?id=php:shaarli"
license=('ZLIB')
depends=('php')
source=("http://sebsauvage.net/files/${pkgname}_${pkgver}.zip"
		"$pkgname-nginx.conf")
install=$pkgname.install
md5sums=('f1cfc20a032603734d72a57723f91973'
         'a04858a802086ecc3ce9d9e20b397b34')

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  mkdir -p ${_instdir} $pkgdir/etc/webapps/$pkgname
  cd ${_instdir}

  cp -ra "$srcdir/${pkgname}_$pkgver/images" .
  cp -ra "$srcdir/${pkgname}_$pkgver/inc" .
  cp -ra "$srcdir/${pkgname}_$pkgver/tpl" .
  cp -ra "$srcdir/${pkgname}_$pkgver/index.php" .

  install -D -m 644 "$srcdir/${pkgname}_$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m 644 "$srcdir/$pkgname-nginx.conf" "$pkgdir/etc/webapps/$pkgname/$pkgname-nginx.conf"
}

# vim:set ts=2 sw=2 et:
