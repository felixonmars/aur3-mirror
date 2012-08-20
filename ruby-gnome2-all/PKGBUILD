# Maintainer: Guten Ye 
# Contributor: Jeff Wallace <jeff@tjwallace.ca>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl> 
# Contributor: William Rea <sillywilly@gmail.com>

pkgname="ruby-gnome2-all"
pkgver=1.1.4
pkgrel=1
pkgdesc="Ruby Gnome (all) bindings"
arch=("i686" "x86_64")
url="http://ruby-gnome2.sourceforge.jp"
license=("LGPL")
depends=("ruby" "ruby-pkgconfig" "ruby-cairo" "libgnomeprintui" "goocanvas"  "gtksourceview3" "gtkglext")
conflicts=("ruby-gnome2" "ruby-gtk2" "ruby-pango" "ruby-gnomecanvas" "ruby-glib2" "ruby-atk" "ruby-libart" "ruby-gdkpixbuf2" "ruby-gconf2")
provides=("ruby-gnome2" "ruby-gtk2" "ruby-pango" "ruby-gnomecanvas" "ruby-glib2" "ruby-atk" "ruby-libart" "ruby-gdkpixbuf2" "ruby-gconf2")
source=("http://downloads.sourceforge.net/ruby-gnome2/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ruby extconf.rb
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('0afc15e3b099add96e2dcb90a2282ca7')
