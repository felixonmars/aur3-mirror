# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
pkgname=python-flask
pkgver=0.8
pkgrel=1
pkgdesc='Micro webdevelopment framework for Python'
arch=('any')
url='http://flask.pocoo.org/'
license=('BSD')
depends=('python2' 'python-werkzeug' 'python2-jinja')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/F/Flask/Flask-${pkgver}.tar.gz")
md5sums=('a5169306cfe49b3b369086f2a63816ab')

build() {
  cd "${srcdir}/Flask-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

