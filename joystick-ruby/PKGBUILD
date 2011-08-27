# Contributor: David Dent <thewinch@gmail.com>
pkgname=joystick-ruby
pkgver=0.1.0
pkgrel=1
pkgdesc="Joystick bindings for Ruby under Linux"
arch=('i686' 'x86_64')
url='http://pablotron.org/software/joystick-ruby/'
license=('MIT')
depends=('ruby')
source=(http://pablotron.org/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('cc6035ca2707f3bb2b0dcfe11f42a1eb')
build() {
cd $startdir/src/${pkgname}-${pkgver}
/usr/bin/ruby extconf.rb
make || return 1
make DESTDIR=$startdir/pkg install
}

