pkgname=python2-nose-progressive
_pkgname=nose-progressive
pkgver=1.5.1
pkgrel=1
pkgdesc='A nose testrunner with a progress bar and smarter tracebacks'
arch=('i686', 'x86_64')
url='https://github.com/erikrose/nose-progressive'
license=('MIT')
depends=('python2-nose' 'python2-blessings')
source=("https://pypi.python.org/packages/source/n/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1e2780f4d0e2eff5b63715b5bd799274')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python2 setup.py install --root=${pkgdir} --optimize=1
}
