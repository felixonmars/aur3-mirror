pkgname=python2-pattern
pkgver=2.6
pkgrel=2
pkgdesc="Pattern is a web mining module for the Python programming language."
arch=('any')
url="http://www.clips.ua.ac.be/pattern"
license=('BSD')
depends=('python2')
source=(http://www.clips.ua.ac.be/media/pattern-${pkgver}.zip)
sha256sums=('003aa285adc23b72255ca8b9f052c6a2644b245b3a9666af007e086428a950be')

build() {
  cd ${srcdir}/pattern-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1
}
