# Maintainer: Abhijeet Rastogi (shadyabhi) <abhijeet.1989@gmail.com>
# Contributor: Michael C. Fletcher

pkgname=python2-pyvrml97
pkgver=2.3.0b1
pkgrel=1
pkgdesc="Python library for parsing, processing and linearising VRML97 files"
arch=('any')
url="http://sourceforge.net/projects/pyvrml97/"
source=("https://pypi.python.org/packages/source/P/PyVRML97/PyVRML97-${pkgver}.tar.gz")
depends=('python2' 'python2-distribute')
license=('GPL')
build() {
  cd "$srcdir/PyVRML97-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/PyVRML97-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
md5sums=('a2fb58e7ba4d6cd94974616e2f707997')
