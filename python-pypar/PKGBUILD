#Maintainer: Tondu <thomas.gastine at wanadoo.fr>

pkgname=python-pypar
pkgver=2.1.4_94
pkgrel=1
pkgdesc="Pypar is an efficient but easy-to-use module that allows programs written in Python to run in parallel on multiple processors and communicate using message passing."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pypar/"
provides=('pypar')
source=("http://downloads.sourceforge.net/pypar/pypar-$pkgver.tgz")
depends=('python' 'openmpi')
license=('GPL')
md5sums=('5ee3e2170fa3927a292eb8a067165ebc')

build() {
    cd $startdir/src/pypar_$pkgver/source
    python setup.py install --root $startdir/pkg --prefix=/usr || return 1
}
