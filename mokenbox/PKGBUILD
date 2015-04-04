# Maintainer: 3lo0sh <alsajadali12 {at} gmail {dot} com>

pkgname=mokenbox
pkgver=20150403
pkgrel=1
pkgdesc="A theme for Openbox."
arch=('any')
url="http://kenharkey7.deviantart.com/art/Mokenbox-Moka-inspired-openbox-theme-1-0-pre-470306205"
license=('custom')
depends=('openbox')
optdepends=()
source=($pkgname-$pkgver.zip::https://dl.dropboxusercontent.com/u/76143139/mokenbox.zip)
sha1sums=('fb22d23e17e194874552b62485ed61296b69cc2c')

package() {
  cd "$srcdir"
  find moken* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
