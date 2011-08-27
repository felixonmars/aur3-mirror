# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-gtktrayicon
pkgver=0.1.0
pkgrel=2
pkgdesc="Ruby binding for the System Tray Protocol Specification"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('ruby-gnome2')
source=(http://dl.sf.net/sourceforge/ruby-gnome2/$pkgname-$pkgver.tar.gz)
md5sums=('77a47e80a49e5a944da6aaf2768527c8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby extconf.rb gtktrayicon
  make || return 1
  make DESTDIR=$startdir/pkg install
}
