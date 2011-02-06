# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-libburn
pkgver=0.1.0
pkgrel=1
pkgdesc="Provides a Ruby access to libburn"
url="http://ruby-libburn.rubyforge.org"
depends=('ruby' 'libburn')
source=(http://rubyforge.org/frs/download.php/367/$pkgname-$pkgver.tar.gz)
md5sums=('033eea9b54b6656f8490728cda7d8ae2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby extconf.rb
  make || return 1
  make DESTDIR=$startdir/pkg install
}
