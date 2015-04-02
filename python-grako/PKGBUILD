pkgname=python-grako
_pkgname=grako
pkgver=3.5.1
pkgrel=1
pkgdesc='A generator of PEG/Packrat parsers from EBNF grammars (python3 version)'
arch=('i686' 'x86_64')
url='http://bitbucket.org/apalala/grako'
license=('BSD')
depends=('python')
optdepends=('python-colorama' 'python-graphviz')
source=("https://pypi.python.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('22fd91e558a680afe7139975519d149c')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root=${pkgdir} --optimize=1
}
