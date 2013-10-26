# Maintainer: Pyro Devil <p dot devil at gmail dot com>
pkgname=python2-gipc
pkgver=0.3.2
pkgrel=1
pkgdesc="gevent-cooperative child processes and inter-process communication."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/gipc"
license=('MIT')
depends=('python2')
source=("gipc::hg+https://bitbucket.org/jgehrcke/gipc#tag=${pkgver}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/gipc"

  python2 setup.py install --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
