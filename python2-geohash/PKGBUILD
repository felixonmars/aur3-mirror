# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-geohash
pkgver=0.8.4
pkgrel=1
pkgdesc="a fast, accurate python geohashing library"
arch=('any')
url="http://code.google.com/p/python-geohash/"
license=('Apache')
depends=('python2')
options=(!emptydirs)
source=("http://python-geohash.googlecode.com/files/python-geohash-$pkgver.tar.gz")
md5sums=('283e91cb8362e0a3b70bc7e431772c1a')
package() {
  cd "$srcdir/python-geohash-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
