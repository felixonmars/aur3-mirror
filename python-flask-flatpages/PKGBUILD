# Contributor: Low Kian Seong <kianseong@gmail.com>
pkgname='python-flask-flatpages'
pkgver='0.1'
pkgrel='1'
pkgdesc='Provides flat static pages to a Flask application, based on text files as opposed to a relationnal database.'
arch=('any')
url='http://pypi.python.org/pypi/Flask-FlatPages/'
license=('BSD')
depends=('python2' 'python-werkzeug' 'python-yaml' 'python-flask' 'python-markdown')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/F/Flask-FlatPages/Flask-FlatPages-${pkgver}.tar.gz")
md5sums=('ade39d24b2bddde2d55158ed32d96a7b')

build() {
  cd "${srcdir}/Flask-FlatPages-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}



# vim:set ts=2 sw=2 et:
