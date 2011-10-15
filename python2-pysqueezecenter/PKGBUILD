# Maintainer: Mika Fischer <mika.fischer@zoopnet.de>
pkgname=python2-pysqueezecenter
_pkgname=pysqueezecenter
pkgver=0.94
pkgrel=2
pkgdesc="Python Wrapper Library for Logitech SqueezeCenter CLI (Telnet) Interface"
arch=('any')
url="http://code.google.com/p/pysqueezecenter"
license=('GPL')
depends=('python2')
makedepends=('python2' 'python2-distribute')
source=("http://pysqueezecenter.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz")
md5sums=('da3767fb3da25afb3d4206ece8345b99')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
