#Mantainer: Igor Nemilentsev <trezorg@gmail.com>
pkgname=python-toscawidgets
pkgver=0.9.10
pkgrel=1
pkgdesc="Web widget creation toolkit based on TurboGears widgets"
arch=('i686' 'x86_64')
url="http://toscawidgets.org"
license=('MIT')
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/T/ToscaWidgets/ToscaWidgets-${pkgver}.tar.gz")
md5sums=('0339859015b178d379053fb0f38ba82e')
build() {
  cd ${srcdir}/ToscaWidgets-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
