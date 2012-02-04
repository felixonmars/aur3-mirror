pkgname=python2-gviz_api
_pkgname=gviz_api
pkgver=1.7.0
pkgrel=1
pkgdesc="Google visualization Python API"
arch=(any)
url="http://code.google.com/p/google-visualization-python/"
license=('Apache 2.0')
depends=('python2')
replaces=()
source=(http://google-visualization-python.googlecode.com/files/${_pkgname}_py-${pkgver}.tar.gz)
md5sums=('b858296b8209809c90f68a63aaca03a3')

build() {
    cd "${srcdir}/google-visualization-python"
    
    python2 setup.py install --root="${pkgdir}"/ || return 1 
}