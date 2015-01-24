# Contributor: Tim Rice <t DOT rice AT ms DOT unimelb DOT edu DOT au>

pkgname=python2-gdblib
pkgver=0.5
pkgrel=1
pkgdesc="A python module to interact with GDB."
arch=(any)
url="https://github.com/skibyte/gdblib"
license=('LGPL3')
depends=('python2' 'gdb')
makedepends=()
_name="gdblib"
source=("https://github.com/skibyte/${_name}/archive/${pkgver}.tar.gz")
md5sums=('db7363b4e4c1214881a4f04a1c18a316')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
}

#check() {
#  cd "${srcdir}/${_name}-${pkgver}"
#  python2 setup.py test
#}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
