# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname='python2-gntp'
_name='gntp'
pkgver=1.0.2
pkgrel=1
pkgdesc='Python bindings for the Growl Notification Transport Protocol'
arch=('any')
url='http://kungfudiscomonkey.net/gntp/'
license=('MIT')
depends=('python2')
source=("http://pypi.python.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz"
        "https://github.com/kfdm/gntp/raw/master/LICENSE")
sha256sums=('8b94a071deca2a1d24825620bf781e6261e1587bc9c401c7c7258abed934fc78'
            'a8a23b78cc7c3feb4f8e988df7536e9245902fe251309f4fc23025c9e63e12e5')

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python2 setup.py install --root=${pkgdir}
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

