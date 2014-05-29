# Maintainer: Amir Mohammadi <183.amir@gmail.com>
pkgname=python2-khayyam
pkgver=0.9.2
pkgrel=1
pkgdesc="Khayyam is a library to use date & time in persian style(known as Jalali calendar or khayyam alg)"
arch=('any')
url="https://pypi.python.org/pypi/Khayyam"
license=('unknown')
depends=('python2')
makedepends=('python2-pip')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/K/Khayyam/Khayyam-0.9.2.tar.gz)
md5sums=('dbc1ac1f21a05f3fe441a7f74a58b1bf')

check() {
	cd "$srcdir/Khayyam-$pkgver"
	python2 -c 'import khayyam'
}

package() {
  cd "$srcdir/Khayyam-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
