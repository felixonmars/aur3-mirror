# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-shout
pkgver=2.1
pkgrel=1
pkgdesc="Ruby bindings for libshout"
arch=('i686' 'x86_64')
url="http://ruby-shout.rubyforge.org"
license=('BSD')
depends=('ruby' 'libshout')
source=(http://rubyforge.org/frs/download.php/7211/ruby-shout-$pkgver.tar.gz)
md5sums=('10a3adc40dfe0100f9c845a3e56adf68')

build() {
  cd $startdir/src/ruby-shout-$pkgver/ext
  ruby extconf.rb
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D ../README $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
