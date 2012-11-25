pkgname="python2-flask-lesscss"
pkgver=0.9.1
pkgrel=1
pkgdesc="A small Flask extension that adds LessCSS support to Flask."
arch=("any")
url="http://pypi.python.org/pypi/flask-lesscss"
license=("MIT")
depends=("python2" "lessc" "python2-flask")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/f/flask-lesscss/flask-lesscss-${pkgver}.tar.gz")
md5sums=("502640ef1afd16ed50892aba3370e88d")

build() {
  cd "${srcdir}/flask-lesscss-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}
