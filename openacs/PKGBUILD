# Author: Thomas Taylor <thomas.taylor@gmx.net>

pkgname=openacs
pkgver=5.8.0
pkgrel=1
pkgdesc="Toolkit for building scalable, community-oriented web applications"
arch=('any')
url="http://openacs.org/"
license=(GPL2)
depends=('aolserver-core' 'aolserver-modules')
source=("http://openacs.org/projects/openacs/download/download/$pkgname-$pkgver.tar.gz")
md5sums=('4a9e007cc1b9afc45e6a3d43a52387c7')

package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname-$pkgver"
  chmod 755 "$pkgdir/opt/$pkgname-$pkgver"
  cd "$pkgdir"
#  ln -s "$pkgname-$pkgver" "aolserver/$pkgname"
}

install="$pkgname.install"

# vim:set ts=2 sw=2 et:
