# Contributor: Low Kian Seong <kianseong@gmail.com>
pkgname='python2-flask-flatpages'
pkgver='0.5'
pkgrel='1'
pkgdesc='Provides flat static pages to a Flask application, based on text files as opposed to a relationnal database.'
arch=('any')
url='http://pypi.python.org/pypi/Flask-FlatPages/'
license=('BSD')
depends=('python2-yaml' 'python2-flask' 'python2-markdown')
makedepends=('setuptools')

source=("http://pypi.python.org/packages/source/F/Flask-FlatPages/Flask-FlatPages-${pkgver}.tar.gz")
sha1sums=('08f05c88841fd1f682906a47760b40a798283c21')

build() {
  cd "Flask-FlatPages-${pkgver}"
  python2 setup.py build
}

check() {
  cd "Flask-FlatPages-${pkgver}"
  python2 setup.py check
}

package() {
  cd "Flask-FlatPages-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr'

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
