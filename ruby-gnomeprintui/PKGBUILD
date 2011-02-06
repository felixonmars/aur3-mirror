# Maintainer: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-gnomeprintui
pkgver=0.16.0
pkgrel=1
pkgdesc="Ruby GnomePrintUI bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-gnomeprint' 'ruby-gtk2')
source=(http://dl.sourceforge.net/sourceforge/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('b3b4f81ef0fe2ce6b3f965bb7c6d3686')

build() {
  cd $startdir/src/ruby-gnome2-all-$pkgver

  # GnomePrintUI can't be built without also building GnomePrint
  ruby extconf.rb gnomeprint gnomeprintui
  make || return 1
  make DESTDIR=$startdir/pkg install

  # Remove the files that are in GnomePrint
  rm $startdir/pkg/usr/lib/ruby/site_ruby/1.8/gnomeprint2.rb
  rm $startdir/pkg/usr/lib/ruby/site_ruby/1.8/${CARCH}-linux/gnomeprint2.so
}
