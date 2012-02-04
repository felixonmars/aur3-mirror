# Maintainer: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-gnomeprint
pkgver=0.16.0
pkgrel=1
pkgdesc="Ruby GnomePrint bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-libart' 'ruby-pango' 'libgnomeprint')
source=(http://dl.sourceforge.net/sourceforge/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('b3b4f81ef0fe2ce6b3f965bb7c6d3686')

build() {
  cd $startdir/src/ruby-gnome2-all-$pkgver
  ruby extconf.rb gnomeprint
  make || return 1
  make DESTDIR=$startdir/pkg install
}
