# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=cnfggr
pkgver=0.0.3
pkgrel=1
pkgdesc="A basic configuration helper"
arch=('any')
url="https://github.com/eyolfson/cnfggr/"
license=('GPL3')
depends=('pacman' 'python')
makedepends=('python-setuptools')
source=("https://github.com/eyolfson/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d204f5828e0285b236ce3c15c194778991a6587bd7fe48c84247281d07611607')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
