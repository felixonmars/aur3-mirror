# Maintainer: Jan Helbling <jan.helbling@gmail.com>
# Contributor: Jan Helbling <jan.helbling@gmail.com>
pkgname="py9kw"
pkgver="1.0"
pkgrel=1
pkgdesc="A Python3 API for the Capthasolving service 9kw.eu"
arch=('any')
url="https://github.com/JanHelbling/py9kw"
license=('GPL3')
provides=('proxychecker')
source=("git+${url}.git")
depends=('python>=3')
makedepends=('python>=3')
md5sums=('SKIP')

build() {
   cd "${pkgname}"
   python setup.py build
}

package() {
   cd "${pkgname}"
   python setup.py install --optimize=1 --prefix="/usr" --root="${pkgdir}"
}
