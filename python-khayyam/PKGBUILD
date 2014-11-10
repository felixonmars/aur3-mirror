# Maintainer: Amir Mohammadi <183.amir@gmail.com>
pkgname=python-khayyam
pkgver=1.0.0
pkgrel=1
pkgdesc="Khayyam is a library to use date & time in persian style (known as Jalali calendar or khayyam alg)"
arch=('any')
url="https://pypi.python.org/pypi/Khayyam"
license=('GPLv3')
depends=('python')
makedepends=('python-pip')
source=($pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/K/Khayyam/Khayyam-$pkgver.tar.gz)
md5sums=('469117008a88a1d82c853dd4bec586f1')

package() {
  cd "$srcdir/Khayyam-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
