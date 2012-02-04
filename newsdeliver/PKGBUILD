# Maintainer: Vlad Dogaru <ddvlad at rosedu dot org>
# Contributor: Nathan Owe < ndowens.aur at gmail dot com>
pkgname=newsdeliver
pkgver=1.4.1
pkgrel=3
pkgdesc="A customizable nntp to email gateway intended for people who want to get notified of a new message"
arch=('any')
url="http://newsdeliver.sf.net"
license=('GPL2')
depends=('python2')
source=(http://downloads.sourceforge.net/newsdeliver/$pkgname-$pkgver.tar.gz)
md5sums=('4571ca862301157b047363175031a2ef') 

build() {
  /bin/true
}
package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 newsdeliver $pkgdir/usr/bin/newsdeliver
  sed -i -e '1s/python/python2/' $pkgdir/usr/bin/newsdeliver
}
