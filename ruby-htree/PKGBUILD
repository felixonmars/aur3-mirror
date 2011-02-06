# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=ruby-htree
pkgver=0.7
pkgrel=2
pkgdesc="Provides a tree data structure which represent HTML and XML data."
arch=('i686' 'x86_64')
url="http://www.a-k-r.org/htree/index.html"
license=('GPL')
depends=('ruby')
source=(http://www.a-k-r.org/htree/htree-$pkgver.tar.gz)
md5sums=('a65a52be7acdf91ddc7388c6fbc06763') 

build() {
  /bin/true
}
package() {
  cd $srcdir/htree-$pkgver

  ruby install.rb --destdir=$pkgdir/
}

# vim:set ts=2 sw=2 et:
