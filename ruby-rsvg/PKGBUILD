# $Id: PKGBUILD,v 1.5 2007/06/22 05:33:54 Snowman Exp $
# Maintainer: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-rsvg
pkgver=0.16.0
pkgrel=1
pkgdesc="Ruby librsvg bindings."
arch=('i686' 'x86_64')
url="http://ruby-gnome2.sourceforge.jp"
license=('LGPL')
depends=('librsvg' 'ruby-glib2' 'ruby-gdkpixbuf2')
source=(http://dl.sourceforge.net/sourceforge/ruby-gnome2/ruby-gnome2-all-$pkgver.tar.gz)
md5sums=('b3b4f81ef0fe2ce6b3f965bb7c6d3686')

build() {
  cd $startdir/src/ruby-gnome2-all-$pkgver
  ruby extconf.rb rsvg
  make || return 1
  make DESTDIR=$startdir/pkg install
}
