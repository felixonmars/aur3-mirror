# Maintainer: spider-mario <spidermario@free.fr>
pkgname=gnustep-theme-gtk-svn
pkgver=36964
pkgrel=1
pkgdesc="GTK+ theme for GNUstep"
arch=(i686 x86_64)
url="http://www.gnustep.org/"
license=('LGPL')
depends=('gnustep-gui' 'gnustep-base' 'gtk2' 'gconf')
makedepends=('subversion' 'gnustep-make' 'gcc-objc')
provides=('gnustep-theme-gtk')
conflicts=('gnustep-theme-gnome-svn')
replaces=('gnustep-theme-gnome-svn')
install=gnustep-theme-gtk.install
source=('themes::svn+http://svn.gna.org/svn/gnustep/plugins/themes')
sha512sums=('SKIP')

pkgver() {
  cd themes
  svnversion
}

prepare() {
  cd themes/Gtk
  sed -e 's/-O0 # //' -i GNUmakefile || true
}

build() {
  cd themes/Gtk

  . /etc/profile.d/GNUstep.sh
  make
}

package() {
  cd themes/Gtk

  . /etc/profile.d/GNUstep.sh
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
