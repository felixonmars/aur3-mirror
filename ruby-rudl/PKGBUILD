# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-rudl
pkgver=0.8
pkgrel=3
pkgdesc="Ruby SDL bindings"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rudl/"
license=('GPL2')
depends=('ruby' 'sdl_mixer' 'sdl_image' 'sdl_ttf' 'sdl_gfx')
source=(http://downloads.sourceforge.net/rudl/rudl-$pkgver-source.tar.gz gcc4-ruby-1.9.2.patch)
md5sums=('aba322c3fa45b2043e186f7551cac64b' '7a2c2c74324a029bbaae94fb4b33aecd')

build() {
  cd "$srcdir/rudl-$pkgver"
  patch -Np1 -i ../gcc4-ruby-1.9.2.patch 

  ruby extconf.rb 
  make 
  make DESTDIR="$pkgdir/" install
}

