# Maintainer: Florian Léger <florian6 dot leger at laposte dot fr>

pkgname=python-autoextension
pkgver=1.1.1
pkgrel=2
pkgdesc="Python library to ease modular application design."
arch=('any')
url='http://florian.leger2.free.fr/downloads/softwares/pyAutoExtension/'
license=('GPL')
depends=('python')
makedepends=('python-distribute')
source=("http://florian.leger2.free.fr/downloads/softwares/pyAutoExtension/pyAutoExtension-${pkgver}.tar.bz2")
md5sums=('4487d49e52affa818a8db9d769c33e9d')

package() {
  cd "${srcdir}/pyAutoExtension-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 || return 1
}

