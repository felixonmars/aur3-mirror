# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=pybik
pkgver=1.1.1
pkgrel=1
pkgdesc="Single player puzzle game. Besides the cube the program can handle towers and bricks (non cubic puzzles) and solve them."
arch=('any')
url="https://launchpad.net/pybik"
license=('GPL3')
depends=('mesa' 'python-numpy' 'python-pyqt4')
makedepends=('cython' 'glm' 'help2man' 'intltool')
conflicts=('pybik-bzr')
source=(http://launchpad.net/pybik/trunk/$pkgver/+download/pybik-$pkgver.tar.gz)
md5sums=('454391d3493247fd25d84e7a3d96bec4')

prepare() {
   cd $srcdir/$pkgname-$pkgver

   # Cython3 fix
   sed -i 's|cython3|cython|' setup.py
}

package() {
   cd $srcdir/$pkgname-$pkgver   
   python setup.py install --root $pkgdir --optimize=1
}
