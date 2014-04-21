# Maintainer: Christer Edwards <christer.edwards@gmail.com>

pkgname=halite
pkgver=0.1.16
pkgrel=1
pkgdesc="SaltStack Web UI"
arch=(any)
url="https://github.com/saltstack/halite"
license=("APACHE")
depends=('python2' 'salt' 'python2-cherrypy')
backup=()
makedepends=()
optdepends=('python2-paste' 'python2-gevent')
options=()
conflicts=()
install=halite.install

source=("http://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz")

md5sums=('07372c85d8a6bcf77f5f704a22eb2818')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
