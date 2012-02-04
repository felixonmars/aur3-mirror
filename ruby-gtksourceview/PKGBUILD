# Maintainer: Jeff Wallace <jeff@tjwallace.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=ruby-gtksourceview
pkgver=0.18.1
pkgrel=1
pkgdesc="Ruby gtksourceview bindings"
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('gtksourceview' 'ruby-gtk2')
source=(http://dl.sourceforge.net/sourceforge/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('7b312986a9098cbfa180b3ae46cee063')

build() {
  cd $startdir/src/ruby-gnome2-all-$pkgver/gtksourceview
  ruby extconf.rb
  make || return 1
  make DESTDIR=$startdir/pkg install
}

