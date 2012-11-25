pkgname="python2-flask-markdown"
pkgver=0.3
pkgrel=1
pkgdesc="Markdown Jinja2 extension for Flask"
arch=("any")
url="http://pypi.python.org/pypi/Flask-Markdown"
license=("BSD")
depends=("python2" "python2-markdown" "python2-flask")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-Markdown/Flask-Markdown-${pkgver}.tar.gz")
md5sums=("37bf5cf3171adb8ba8d2235cb4ef049f")

build() {
  cd "${srcdir}/Flask-Markdown-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" || return 1
}
