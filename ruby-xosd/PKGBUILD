# Contributor: Moritz Heidkamp <moritz@invision-team.de>
pkgname=ruby-xosd
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple binding to the xosd library for the Ruby programming language that allows displaying of arbitrary notifications in X11."
arch=(i686)
url="http://rubyforge.org/projects/ruby-xosd/"
license=('MIT')
depends=(ruby xosd)
makedepends=(ruby xosd)
source=(http://rubyforge.org/frs/download.php/17832/$pkgname-$pkgver.tar.bz2)
md5sums=('e59f3f945296a9fe126d838448e386d7')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ruby extconf.rb
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
