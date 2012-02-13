# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname='python2-pbs'
_name='pbs'
pkgver=0.94
pkgrel=1
pkgdesc='subprocess wrapper that maps system programs to Python functions'
arch=('any')
url='https://github.com/amoffat/pbs'
license=('MIT')
depends=('python2')
makedepends=('python2')
source=("http://pypi.python.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.github.com/amoffat/pbs/master/LICENSE.txt")
sha256sums=('0b101b709f8f868d0e9b3f03c1b373af0d6c8daeb0aa35bc177617c51f49db1b'
            'd8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706')

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python2 setup.py install --root=${pkgdir}
    install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

