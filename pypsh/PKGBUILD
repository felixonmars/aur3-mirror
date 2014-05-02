# Maintainer: Mathias Fussenegger <f.mathias <æŧ> zignar DOT net>

pkgname=pypsh
pkgver=0.7.2
pkgrel=1
pkgdesc="cli for parallel ssh command execution on all known_hosts that match a given regex"
url="https://github.com/mfussenegger/pypsh"
source=("https://github.com/mfussenegger/pypsh/archive/0.7.2.tar.gz")
depends=('python-paramiko'
         'python-termcolor')
license=('MIT')
arch=('any')

build() {
    cd "${srcdir}/pypsh-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/pypsh-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
md5sums=('81bce9901dae2cfe136b85b56617f2d4')
