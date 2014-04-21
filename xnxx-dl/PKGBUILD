# Maintainer: Jan Helbling <jan.helbling@gmail.com>
# Contributor: Jan Helbling <jan.helbling@gmail.com>
pkgname="xnxx-dl"
pkgver=0.6
pkgrel=1
pkgdesc="A small python3 tool to download videos from xnxx.com"
arch=('any')
url="https://github.com/JanHelbling/xnxx-dl"
license=('GPL3')
provides=('xnxx-dl')
source=("${url}/archive/${pkgver}.tar.gz")
depends=('python>=3')
makedepends=('python>=3 python-distutils-extra')
md5sums=('c86c47a8ebb2c4f225c12b510b239020')

build() {
   cd "${pkgname}-${pkgver}"
   python setup.py build
}

package() {
   cd "${pkgname}-${pkgver}"
   python setup.py install --optimize=1 --prefix="/usr" --root="${pkgdir}"
}
