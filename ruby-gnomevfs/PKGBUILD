# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=ruby-gnomevfs
pkgver=0.19.4
pkgrel=1
pkgdesc="Ruby GnomeVFS bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby' 'gnome-vfs')
source=(http://downloads.sourceforge.net/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('40451e4173e2c8bcd5046aea7e499ef9')

build() {
  cd "$srcdir/ruby-gnome2-all-$pkgver"
  ruby extconf.rb gnomevfs || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
