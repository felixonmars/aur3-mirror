# Maintainer: Augusto Roccasalva <augusto@rioplomo.com.ar>

pkgname=todotxt-machine
pkgver=2.0.5
pkgrel=1
pkgdesc="Interactive terminal todo.txt file editor with an interface similar to mutt"
url="https://github.com/AnthonyDiGirolamo/todotxt-machine"
arch=('any')
license=('GPL3')
depends=('python' 'python-urwid' 'python-docopt')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('15f5e82f49c311369bb4657f7499459d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
