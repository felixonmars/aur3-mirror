# Contributor: Low Kian Seong <kianseong@gmail.com>

pkgname=python-cronwrap
pkgver=1.4
pkgrel=2
pkgdesc='cron job wrapper that wraps jobs and enables better error reporting and command timeouts'
arch=('any')
url='http://pypi.python.org/pypi/cronwrap/'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/c/cronwrap/cronwrap-${pkgver}.tar.gz")
md5sums=('2ea701eb737454a4462e33da81385604')


package() {
  cd "${srcdir}/cronwrap-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"
}



# vim:set ts=2 sw=2 et:
