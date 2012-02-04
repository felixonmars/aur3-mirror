# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=wow-nebdaar-wallpaper
pkgver=1.0
pkgrel=1
pkgdesc="Nebdaar's panoramic wallpapers from World of Warcraft."
arch=(i686 x86_64)
url="http://www.nebdaar.com/wow/"
license=('GPL')
source=(http://www.nebdaar.com/wow/wallpapers/nebdaars-wow-wallpapers.zip)
md5sums=('fcb134f3f41d4a6fd1d5b94dec03c98a')

build() {
  cd "$startdir/src/"
  mkdir -p "$startdir/pkg/usr/share/wallpapers/wow/"
  # Installing wallpapers
  cp $startdir/src/*jpg $startdir/pkg/usr/share/wallpapers/wow/
}

# vim:set ts=2 sw=2 et:
