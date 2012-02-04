# Contributor MatToufoutu <mattoufootu[at]gmail.com>

pkgname=superpy
pkgver=1.2.6
pkgrel=3
pkgdesc="Supercomputing and parallel processing for python"
url="http://code.google.com/p/superpy/"
arch=('i686' 'x86_64')
license=('MIT')

depends=('python2')

source=("http://superpy.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('1bd84b97a86d2e58122b9aefcbeff085')

builddir=${srcdir}/${pkgname}-${pkgver}

build() {
    cd ${builddir}
    python2 setup.py build || return 1
}

package() {
    cd ${builddir}
    python2 setup.py install --root=${pkgdir} || return 1
    cd ${pkgdir}/usr/bin
    for FILE in *; do
        sed -i '1 i #!/usr/bin/env python2' $FILE
        mv $FILE $(basename $FILE .py)
    done
}
