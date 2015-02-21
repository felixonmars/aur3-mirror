# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>

pkgname=python2-orange-git
pkgver=10392
pkgrel=2
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-numarray' 'python-numeric' 'python2-matplotlib')
makedepends=('git')
optdepends=('pyqwt: GUI support' 'python-networkx: Network module')
provides=('python2-orange')
conflicts=('python2-orange')
source=('git+https://github.com/biolab/orange.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/orange"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir"
  python2 setup.py build || return 1
}

package() {
  cd "${srcdir}/$_hgrepo-build"
  python2 setup.py install --root="${pkgdir}" || return 1
  
  find ${pkgdir} -name '*.py' | while read FILE; do
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
        "$FILE"
  done
}

