#Mantainer: Igor Nemilentsev <trezorg@gmail.com>
pkgname=python-tw.forms
pkgver=0.9.9
pkgrel=1
pkgdesc="Web Widgets for building and validating forms"
arch=('i686' 'x86_64')
url="http://toscawidgets.org"
license=('MIT')
depends=('python2' 'python-toscawidgets')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/t/tw.forms/tw.forms-${pkgver}.tar.gz")
md5sums=('8fb4efef4cbd5d62224b00073b8dd3d7')
build() {
  cd ${srcdir}/tw.forms-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
