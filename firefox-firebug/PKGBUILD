# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=firefox-firebug
pkgver=1.11.4
pkgrel=1
pkgdesc="Tools for web development. Inspect, edit and monitor CSS, HTML, JavaScript and Net requests."
arch=(any)
url="http://getfirebug.com/"
license=('custom:BSD')
depends=('firefox')
provides=('firebug')
source=("${url}releases/firebug/${pkgver%.*}/firebug-$pkgver.xpi")
md5sums=('c5ce520e6e5c473ae3bfa7413c7c1b66')

package() {
  cd "$srcdir"

  # extension
  install -d "$pkgdir/usr/lib/firefox/browser/extensions/firebug@software.joehewitt.com"
  cp -a *[^xpi] ${pkgdir}/usr/lib/firefox/browser/extensions/*

  # license
  install -Dm644 license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
