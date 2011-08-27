# Maintainer: Hervé Cauwelier <herve ¤ oursours.net>

pkgname=python-ipc
pkgver=0.41
pkgrel=2
pkgdesc="Python 2 bindings to System V IPC"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/pyipc/"
depends=()
source=(http://pypi.python.org/packages/source/p/pyipc/pyipc-$pkgver.tar.gz)
md5sums=('13b6caf6ca49c010184db9e554c48d13')

build() {
  cd "${srcdir}/pyipc-$pkgver"
  python2 setup.py install --root="${pkgdir}" || return 1
  # FIXME Add the PSF license
  #install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt" || return 1
}
