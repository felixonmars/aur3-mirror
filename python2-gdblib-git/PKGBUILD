# Contributor: Tim Rice <t DOT rice AT ms DOT unimelb DOT edu DOT au>

pkgname=python2-gdblib-git
pkgver=0.5.r0.g14d9c19
pkgrel=1
pkgdesc="A python module to interact with GDB."
arch=(any)
url="https://github.com/skibyte/gdblib"
license=('LGPL3')
provides=('python2-gdblib')
conflicts=('python2-gdblib')
depends=('python2' 'gdb')
makedepends=('git')
_name="gdblib"
source=("${_name}"::git+https://github.com/skibyte/${_name}.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_name}"
  python2 setup.py build
}

#check() {
#  cd "${srcdir}/${_name}"
#  python2 setup.py test
#}

package() {
  cd "${srcdir}/${_name}"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
