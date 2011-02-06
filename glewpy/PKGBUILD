# Contributor: Martin Skytte <skytte@gmail.com>
pkgname=glewpy
pkgver=0.7.4
pkgrel=2
pkgdesc="Python bindings to the OpenGL Extension Wrangler (GLEW)"
url="http://glewpy.sourceforge.net"
license=('PSF')
depends=('python-pyopengl' 'glew')
makedepends=('pyrex')
arch=('i686')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3d2aae86aae328ab60897915bf9530fc')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
}

