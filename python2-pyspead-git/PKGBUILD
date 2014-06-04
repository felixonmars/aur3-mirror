_pkgname=PySPEAD
pkgname=python2-pyspead-git
pkgver=r71.2eaae30
pkgrel=1
pkgdesc="A fast and light Python implementation of the SPEAD"
arch=('any')
url="https://github.com/ska-sa/PySPEAD"
license=('GPL')
provides=('python2-pyspead')
depends=('python2-numpy')
source=('git+https://github.com/ska-sa/PySPEAD.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
    cd $srcdir/$_pkgname
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}
