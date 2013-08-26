# Contributor: Andreas W. Hauser

pkgname=ruby-crfpp
pkgver=0.58
pkgrel=1
pkgdesc="A Conditional Random Field implementation"
url="http://crfpp.sourceforge.net"
arch=(any)
license=(LGPL BSD)
depends=(ruby crfpp)
source=("crfpp-$pkgver.tar.gz::http://crfpp.googlecode.com/files/CRF%2B%2B-$pkgver.tar.gz")
md5sums=('c8ffd456ab1a6815ba916c1083194a99')


build() {
  cd $srcdir/CRF++-$pkgver/ruby
  ruby extconf.rb
  make
}

package() {
  cd $srcdir/CRF++-$pkgver/ruby
  make DESTDIR=$pkgdir install
}
