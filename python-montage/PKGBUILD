# Maintainer: <clu>

pkgname=python-montage  
pkgver=0.9.3
pkgrel=2
pkgdesc="A Python wrapper for the Montage mosaicking software"
url="http://astrofrog.github.com/python-montage/"
arch=('any')
license=('GPL3')
depends=('python2' 'montage')
optdepends=('python-pyfits: For use of reproduction_hdu function')
makedepends=('python2' 'python2-distribute')
conflicts=()
replaces=()
backup=()
source=(https://github.com/downloads/astrofrog/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ffd96725c412286db010fbe06f6246f6')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --prefix=/usr --optimize=1
}
