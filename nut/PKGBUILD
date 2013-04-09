# Maintainer : speps <speps at aur at archlinux dot org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=nut
pkgver=18.7
pkgrel=1
pkgdesc="Analyze meals with the USDA Nutrient Database"
arch=('i686' 'x86_64')
url='http://nut.sourceforge.net/'
license=('GPL')
makedepends=('desktop-file-utils' 'fltk')
optdepends=('libxft: for fltk frontend'
            'libxinerama: for fltk fontend')
install=nut.install
source=("http://downloads.sourceforge.net/project/nut/nut/$pkgver/nut-$pkgver.tar.gz"
        "nut.desktop" "nut.png")
md5sums=('3e679bec4d54a5eb9336e4ce62b51377'
         '1deaf63e97d1c7e5bea10b52f7bf85f8'
         '6ed4fac9258dce8b0dd0efde060c7720')

build() {
  cd "$pkgname-$pkgver"

  # settable prefix and fix man path
  sed -i "s|^prefix |&+|;s|/man|/share&|" Makefile

  # add missing fltk link flags
  sed -i "/^nut:/{n;s/$/ \$(FONT_CONFIG\)/}" fltk/Makefile

  make prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install

  # desktop file
  install -Dm644 ../nut.desktop \
    "$pkgdir/usr/share/applications/nut.desktop"

  # icon
  install -Dm644 ../nut.png \
    "$pkgdir/usr/share/pixmaps/nut.png"
}
