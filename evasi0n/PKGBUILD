# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=evasi0n
pkgver=1.5.3
pkgrel=1
pkgdesc="iOS 6.x Jailbreak"
arch=('any')
url="http://www.evasi0n.com"
license=('GPL')
depends=('gtk2' 'libimobiledevice' 'libplist' 'usbmuxd' 'openssl')
source=('https://evad3rs.box.com/shared/static/2wk6dtc31bw74j514d40.lzma')
sha1sums=('620dcb7996b1f3497827b11876bf0c2fae069ecf')
package() {
  cd "$srcdir/$pkgname-linux-$pkgver"

  install -Dm644 changelog.txt "$pkgdir/usr/share/$pkgname/changelog.txt"
  install -Dm644 README.txt "$pkgdir/usr/share/$pkgname/README.txt"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  if [[ "$CARCH" == "i686" ]]; then
    install -Dm755 "$pkgname.x86" "$pkgdir/usr/bin/$pkgname.x86"
  else
    install -Dm755 "$pkgname.x86_64" "$pkgdir/usr/bin/$pkgname.x86_64"
  fi
}

# vim:set ts=2 sw=2 et:
