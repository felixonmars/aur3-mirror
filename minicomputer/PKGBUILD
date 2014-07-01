# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: farid abdelnour <farid at archlinux-br.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=minicomputer
pkgver=1.41
pkgrel=3
pkgdesc="A standalone Linux softwaresynthesizer for creating experimental electronic sounds."
arch=('i686' 'x86_64')
url="http://minicomputer.sourceforge.net"
license=('GPL3')
depends=('fltk' 'jack' 'liblo')
makedepends=('scons')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/MinicomputerV$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('d2524f5fee7475159292e29a5bcd73d2'
         '3cc74321d55870b1684767255c74c2f8')

prepare() {
  # installpresets.sh fix
  sed -i "s|factory|/usr/share/$pkgname/&|g" installpresets.sh

  # DSO linking fix
  sed -i "35aenv.Append(LINKFLAGS = ['-lm'])" -i SConstruct

  # missing includes
  sed -i '30a#include <unistd.h>' editor/Memory.h
}

build() {
  scons
}

package() {
  # bin
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$pkgname"{,CPU} "$pkgdir/usr/bin"

  # icon
  install -Dm644 $pkgname.xpm \
    "$pkgdir/usr/share/pixmaps/$pkgname.xpm"

  # desktop file
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # presets
  install -d "$pkgdir/usr/share/$pkgname/factoryPresets"
  install -Dm644 factoryPresets/* "$pkgdir/usr/share/$pkgname/factoryPresets"

  # doc
  install -Dm644 "$pkgname"Manual.pdf \
    "$pkgdir/usr/share/doc/$pkgname/Manual.pdf"

  # presets installer script
  install -Dm755 installpresets.sh \
    "$pkgdir/usr/share/$pkgname/installpresets.sh"
}

# vim:set ts=2 sw=2 et:
