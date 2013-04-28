# Maintainer: Army
_pkgname=dmenu-mpd
pkgname=$_pkgname-git
pkgver=20120819.15
pkgrel=1
pkgdesc="control mpd with dmenu"
arch=('any')
url="https://github.com/UliArmy/dmenu-mpd"
license=('GPL')
depends=('mpc' 'dmenu')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('mpd_control')
source=("$_pkgname::git://github.com/UliArmy/dmenu-mpd.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
