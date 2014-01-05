# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>
pkgname=python2-msnlib
pkgver=3.8
pkgrel=2
pkgdesc="A Python MSN messenger protocol library and client"
arch=( 'any' )
depends=( 'python2' )
url="http://blitiri.com.ar/p/msnlib/"
license=('MIT')
source=("http://blitiri.com.ar/p/msnlib/files/$pkgver/msnlib-$pkgver.tar.bz2")
md5sums=('c751d7d03ddc3742cfe8461f0a9d55b1')

package() {
  cd "$srcdir/msnlib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
