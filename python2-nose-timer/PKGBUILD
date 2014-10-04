pkgname=python2-nose-timer
_pkgname=nose-timer
pkgver=0.3.0
pkgrel=1
pkgdesc='A timer plugin for nosetests'
arch=('i686', 'x86_64')
url="https://github.com/mahmoudimus/nose-timer"
license=('BSD')
depends=('python2-nose')
source=("https://pypi.python.org/packages/source/n/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('d9de3c21ada2fee3780e1047f1f0761f')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py install --root=${pkgdir} --optimize=1
}
