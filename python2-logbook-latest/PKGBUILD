pkgname=python2-logbook-latest
_dlpkgname=Logbook
pkgver=0.4.2
pkgrel=1
pkgdesc="logging sytem for Python that replaces the standard library’s logging module"
arch=(any)
url="http://packages.python.org/Logbook/index.html"
license=('BSD')
depends=('python2>=2.6')
makedepends=('setuptools')
source=("https://pypi.python.org/packages/source/L/Logbook/${_dlpkgname}-${pkgver}.tar.gz")
md5sums=('7b71ad63281c5648e8d30d133347bc21')

build() {
  cd ${srcdir}/${_dlpkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1
}
