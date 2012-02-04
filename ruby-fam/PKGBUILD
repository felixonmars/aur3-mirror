# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-fam  
pkgver=0.2.0
pkgrel=2
pkgdesc="Ruby FAM bindings"
url="http://pablotron.org/software/fam-ruby/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ruby' 'fam')
source=(http://pablotron.org/files/fam-ruby-$pkgver.tar.gz ruby-1.9.1.patch ruby-fam.license)
md5sums=('ecc4bb28c44a3bcef9e423125a06bd09' '0a55213ec4fd9062195a641fa32f0bea'\
         '818be1937bb9dbfd86c423aa3856a7f2')

build() {
  cd $srcdir/fam-ruby-$pkgver
  if [[ "$(ruby --version)" =~ ^ruby\ 1.9 ]]; then
    patch -Np1 -i ../ruby-1.9.1.patch || return 1
  fi

  ruby extconf.rb --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install

  install -d -m 755 $pkgdir/usr/share/licenses/$pkgname
  install -m 644 $srcdir/ruby-fam.license $pkgdir/usr/share/licenses/$pkgname/COPYING
}