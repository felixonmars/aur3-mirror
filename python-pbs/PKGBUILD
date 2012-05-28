# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname='python-pbs'
_name='pbs'
pkgver=0.105
pkgrel=1
pkgdesc='subprocess wrapper that maps system programs to Python functions'
arch=('any')
url='https://github.com/amoffat/pbs'
license=('MIT')
depends=('python')
makedepends=('python')
source=("http://pypi.python.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.github.com/amoffat/pbs/master/LICENSE.txt")
sha256sums=('16dd6ce46013361ff88bfe59996a6e1b8641992aff05bcde5c068a282fcc7e15'
            'd8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706')

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py install --root=${pkgdir}
    install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

