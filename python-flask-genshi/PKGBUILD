# Contributor: Low Kian Seong <kianseong@gmail.com>
pkgname='python-flask-genshi'
pkgver='0.5.1'
pkgrel='1'
pkgdesc='An extension to Flask for easy Genshi templating.'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Genshi/'
license=('BSD')
depends=('python2' 'python-flask' 'python-genshi')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/F/Flask-Genshi/Flask-Genshi-${pkgver}.tar.gz")
md5sums=('700a77251ddf036a965578897cd24864')

build() {
  cd "${srcdir}/Flask-Genshi-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}



# vim:set ts=2 sw=2 et:
