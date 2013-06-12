# Contributor: Low Kian Seong <kianseong@gmail.com>
pkgname='python2-flask-actions'
pkgver='0.6.6'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Actions/'
license=('BSD')
depends=('python2-flask')
makedepends=('setuptools')

source=("http://pypi.python.org/packages/source/F/Flask-Actions/Flask-Actions-${pkgver}.tar.gz")
sha1sums=('7444483e3c49bf30a44386cfd8372a1252891578')

build() {
  cd "Flask-Actions-${pkgver}"
  python2 ./setup.py build
}

check() {
  cd "Flask-Actions-${pkgver}"
  python2 ./setup.py test
}

package() {
  cd "Flask-Actions-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
