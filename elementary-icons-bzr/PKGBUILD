# Maintainer: Ner0

pkgname=elementary-icons-bzr
pkgver=1104
pkgrel=1
pkgdesc="An icon theme designed to be smooth, sexy, clear, and efficient (Development branch)"
arch=('any')
url="https://launchpad.net/elementaryicons"
license=('GPL2')
groups=('pantheon')
depends=('hicolor-icon-theme')
makedepends=('bzr')
optdepends=('egtk-bzr: Development branch of the elementary GTK theme. [AUR]')
conflicts=('elementary-icons')
provides=('elementary-icons')
options=('!strip' '!emptydirs')
source=('bzr+lp:elementaryicons'
        'chrome-chromium.patch')
md5sums=('SKIP'
         'f1ac694e313d9fe991c036aac62ee425')

pkgver() {
  cd "$srcdir/elementaryicons"
  bzr revno
}

prepare() {
  cd "$srcdir/elementaryicons"
  # Add Chrome/Chromium icons (http://spg76.deviantart.com/art/Chrome-Chromium-elementary-201289232)
  patch -Np0 -i "$srcdir/chrome-chromium.patch"
}

package() {
  install -dm755 "$pkgdir/usr/share/icons/"
  cp -dr --no-preserve=ownership "$srcdir/elementaryicons" "$pkgdir/usr/share/icons/elementary"
  rm -rf "$pkgdir"/usr/share/icons/elementary/{.bzr*,AUTHORS,CONTRIBUTORS,COPYING}
}
