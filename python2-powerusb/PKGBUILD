# $Id$
# Maintainer: Mark Lamourine <markllama@gmail.com>

pkgname=python2-powerusb
pkgver=1.4
pkgrel=1
pkgdesc="Library and CLI tools to Control PowerUSB power strips."
url="http://pwrusb.com"
arch=('any')
license=('Apache')
makedepends=('git' 'python2' 'python2-distribute')
depends=('python2' 'python2-lxml' 'python2-pyusb')
source=(git://github.com/markllama/powerusb.git)
sha256sums=('SKIP')

package() {
  depends=('python2')
  cd "$srcdir/powerusb"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
