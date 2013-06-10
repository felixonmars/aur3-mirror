# Maintainer: Diego

pkgname=elementary-icons-vanilla-bzr
pkgver=1124
pkgrel=1
pkgdesc="An icon theme designed to be smooth, sexy, clear, and efficient (Development branch)"
arch=('any')
url="https://launchpad.net/elementaryicons"
license=('GPL2')
groups=('pantheon')
depends=('hicolor-icon-theme')
makedepends=('bzr')
optdepends=('egtk-bzr: Development branch of the elementary GTK theme. [AUR]')
conflicts=('elementary-icons' 'elementary-icons-bzr')
provides=('elementary-icons')
options=('!strip' '!emptydirs')
source=('bzr+lp:elementaryicons')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/elementaryicons"
  bzr revno
}

package() {
  install -dm755 "$pkgdir/usr/share/icons/"
  cp -dr --no-preserve=ownership "$srcdir/elementaryicons" "$pkgdir/usr/share/icons/elementary"
  rm -rf "$pkgdir"/usr/share/icons/elementary/{.bzr*,AUTHORS,CONTRIBUTORS,COPYING}
}
