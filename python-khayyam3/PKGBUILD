# Maintainer: Amir Mohammadi <183.amir@gmail.com>
pkgname=python-khayyam3
pkgver=1.0.0
pkgrel=2
pkgdesc="Khayyam3 is a library to use date & time in persian style (known as Jalali calendar or khayyam alg)"
arch=('any')
url="https://pypi.python.org/pypi/Khayyam3"
license=('unknown')
depends=('python')
makedepends=('python-pip')
source=($pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/K/Khayyam3/Khayyam3-$pkgver.tar.gz)
md5sums=('9ba9ffb668ab2fe20ed6bd4f2027bc2b')

package() {
  cd "$srcdir/Khayyam3-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
