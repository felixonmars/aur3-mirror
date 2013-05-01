# Maintainer: Daniel Oertwig <Daniel.Oertwig+ntpasswordhash at gmail dot com>

pkgname=hostapd-nt_password_hash
pkgver=2.0
pkgrel=1
pkgdesc="Tool from hostapd to generate NtPasswordHash for MSCHAPv2 or MSCHAP"
arch=('i686' 'x86_64')
url="http://w1.fi/hostapd/"
license=('custom')
depends=('openssl')
source=(http://w1.fi/releases/hostapd-$pkgver.tar.gz
        config)
md5sums=('ba22e639bc57aa4035d2ea8ffa9bbbee'
         '5d7ee10b04e33f22c37be56a4c33dddb')

build() {
  cd hostapd-$pkgver/hostapd
  cp ../../config .config
  make nt_password_hash
}

package() {
  cd hostapd-$pkgver
  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd hostapd
  # Binaries
  install -d "$pkgdir/usr/bin"
  install -t "$pkgdir/usr/bin" nt_password_hash
  # Man pages
	# TODO: missing
}
