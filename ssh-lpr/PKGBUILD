# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
pkgname=ssh-lpr
pkgver=1
pkgrel=1
pkgdesc="SSH-LPR Backend for CUPS"
arch=(any)
url="http://www.masella.name/technical/sshlpr.html"
license=('unknown')
groups=()
depends=('cups')
source=("http://www.masella.name/technical/sshlpr.sh")
sha256sums=('971f9657e44f5ed645713069f7774af412024edf46e598c1044e35e1bafeffa1')

package() {
  install -D -m0755 "$srcdir/sshlpr.sh" "$pkgdir/usr/lib/cups/backend/sshlpr"
}

# vim:set ts=2 sw=2 et:
