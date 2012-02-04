# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-amazon
pkgver=0.9.0
pkgrel=3
pkgdesc="Ruby library that allows access to Amazon"
arch=('i686' 'x86_64')
url="http://www.caliban.org/ruby/ruby-amazon.shtml"
license=('GPL')
depends=('ruby')
source=(http://www.caliban.org/files/ruby/$pkgname-$pkgver.tar.gz)
md5sums=('e33a51b767142356a0363273ce79ce63')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg
}
