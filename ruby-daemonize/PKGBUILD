# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-daemonize  
pkgver=0.1.2
pkgrel=1 
pkgdesc="Daemonize Ruby programs"
url="http://grub.ath.cx/daemonize/"
arch=('i686' 'x86_64')
license=('RUBY')
depends=('ruby')
source=(http://grub.ath.cx/daemonize/daemonize-$pkgver.tar.gz)
md5sums=('a14f6c28a045640f0caea379b1792852')

build() {
  cd $srcdir/daemonize-$pkgver
  ruby setup.rb all --prefix=$pkgdir/usr || return 1
}