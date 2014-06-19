pkgname=python-wikipedia
_pkgname=wikipedia
pkgver=1.1
pkgrel=2
pkgdesc='A Python library that makes it easy to access and parse data from Wikipedia.'
arch=('i686', 'x86_64')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('MIT')
depends=('python>=3.3' 'python-requests' 'python-beautifulsoup4')
source=("https://pypi.python.org/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('6ae2500b1d361281edea81f9f6493d5b')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"

    python setup.py install --root=${pkgdir} --optimize=1
}
