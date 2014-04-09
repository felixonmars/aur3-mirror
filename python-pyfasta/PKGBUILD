# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=python-pyfasta
pkgver=0.5.2
pkgrel=1
pkgdesc="Fast, memory-efficient, pythonic (and command-line) access to fasta sequence files."
arch=("any")
url="http://pypi.python.org/pypi/pyfasta"
license=("MIT")
depends=("python")
optdepends=("python-numpy")
makedepends=("python-setuptools")
source=("http://pypi.python.org/packages/source/p/pyfasta/pyfasta-$pkgver.tar.gz")
sha1sums=("8c7aa0158202e011739c71c14e3681e3fc081c00")

build() {
    cd $srcdir/pyfasta-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyfasta-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
