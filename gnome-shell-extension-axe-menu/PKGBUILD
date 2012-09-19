# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-axe-menu
_pkgname=axemenu-gnome-shell
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc="Big and beautiful menu for gnome-shell"
arch=('any')
url="http://k210.org/axemenu/"
license=('GPL')
groups=()
depends=('gnome-shell')
source=(http://k210.org/axemenu/last/"$_pkgname"_v$pkgver.tar.gz)
noextract=("$_pkgname"_v$pkgver.tar.gz)
md5sums=('b6b7fdaa673c690ac94d9c1252aabac0')

package() {
  cd "$srcdir"/
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
  bsdtar xf "$_pkgname"_v$pkgver.tar.gz -C \
  $pkgdir/usr/share/gnome-shell/extensions/
}

# vim:set ts=2 sw=2 et:
