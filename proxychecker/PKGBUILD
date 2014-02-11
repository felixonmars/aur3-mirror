# Maintainer: Jan Helbling <jan.helbling@gmail.com>
# Contributor: Jan Helbling <jan.helbling@gmail.com>
pkgname="proxychecker"
pkgver=1.5
pkgrel=1
pkgdesc="A multithreaded,advanced ProxyChecker and Hitfaker, written in Python3"
arch=('any')
url="https://github.com/JanHelbling/proxychecker"
license=('GPL3')
provides=('proxychecker')
source=("${url}/archive/${pkgver}.tar.gz")
depends=('python>=3')
makedepends=('python>=3 python-distutils-extra')
md5sums=('9e4e829c36ed80de5433529c9d9b6950')

build() {
   cd "${pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${pkgname}-${pkgver}"
   python setup.py install --optimize=1 --prefix="/usr" --root="${pkgdir}"
}
