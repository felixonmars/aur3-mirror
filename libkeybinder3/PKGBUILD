# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=libkeybinder3
pkgver=0.3.0
pkgrel=1
pkgdesc="A library for registering global keyboard shortcuts. Gtk3 version."
arch=(i686 x86_64)
url="http://kaizer.se/wiki/keybinder/"
license=('custom:X11')
depends=('gtk3')
makedepends=('gnome-common' 'gtk-doc')
optdepends=('lgi-git: lua bindings')
conflicts=('keybinder3')
options=('!libtool')
source=("https://github.com/engla/keybinder/tarball/keybinder-3.0")
md5sums=('SKIP')

build() {
  cd "$srcdir/engla-keybinder-"*
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/engla-keybinder-"*
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
