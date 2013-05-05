# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>

_pkgname=cairoplot-gnome15
pkgname=python2-cairoplot-gnome15
pkgver=1.1b
pkgrel=1
pkgdesc="Python API to plot graphics (Gnome15 fork)"
arch=(any)
url="http://www.russo79.com/gnome15"
license=('LGPL')
depends=('python2' 'python2-cairo')
replaces=('python-cairoplot')
provides=('python2-cairoplot')
conflicts=('python2-cairoplot')
source=("https://projects.russo79.com/attachments/download/78/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3b1df7bb6b1f19a234161fec484ae517')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    find . -name '*.py' | xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}
