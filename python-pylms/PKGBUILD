# Maintainer: Mika Fischer <mika.fischer@zoopnet.de>
pkgname=python-pylms
_pkgname=pylms
pkgver=1.0
pkgrel=2
pkgdesc="Python Wrapper Library for Logitech Media Server CLI (Telnet) Interface"
arch=('any')
url="https://github.com/jingleman/PyLMS"
license=('GPL')
depends=('python')
makedepends=('python' 'python-distribute')
source=("http://pypi.python.org/packages/source/p/pylms/${_pkgname}-${pkgver}.tar.gz"
        'fix-tab.patch'
        'fix-python3.patch')
md5sums=('19b7a3d06fde7d482df014ed948e59e0'
         'a9ec4c224fdc0c0bc178c4ab7b75b27e'
         '0fc8043fd8195ae1eaf7e60fa7bef13e')

build()
{
    cd "${srcdir}"
    patch -uN -p0 < fix-tab.patch
    patch -uN -p0 < fix-python3.patch
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py build
}

package()
{
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
