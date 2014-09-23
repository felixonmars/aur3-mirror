# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=python-asyncio
_pkgname=asyncio
pkgver=3.4.1
pkgrel=1
pkgdesc="Reference implementation of PEP 3156"
arch=('any')
url="https://pypi.python.org/pypi/asyncio"
license=('python')
depends=('python')
source=(https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('7dc164ad37905ca3745576d0b9dfb2de')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  yes | python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  yes | python setup.py install --root="${pkgdir}"
}

