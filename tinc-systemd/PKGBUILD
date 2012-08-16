pkgname=tinc-systemd
pkgver=1
pkgrel=1
pkgdesc="systemd unit files for community/tinc"
arch=('any')
url="http://www.tinc-vpn.org"
license=('GPL3')
depends=('tinc' 'systemd')
source=('tincd@.service' 'tincd.service')

package() {
  install -D -m644 "$srcdir/tincd@.service" "$pkgdir/usr/lib/systemd/system/tincd@.service"
  install -D -m644 "$srcdir/tincd.service" "$pkgdir/usr/lib/systemd/system/tincd.service"
}

sha512sums=('3099ec35644eadd948b0d252bec0a02381276a28ab639d6ae061c2b74354038b738d6d5a2138b978283a02124e0473bbf22aa27836781c55d452977d99f417e9'
            'd24cb76cb5c99fcbcdd7a5711468e277a14d03be81d06eb579229c8fb2363e5f6dea5af81a411f1f4f6bcd3157c4a4dc7b4d7123fdf696dc3a9d353fc478f33c')
