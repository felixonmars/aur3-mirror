# Maintainer: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=python2-colorconsole  
pkgver=0.5
pkgrel=1 
pkgdesc="Python console routines"
url="http://code.google.com/p/colorconsole/"
arch=('any')
license=('GPL')
depends=('python2')
source=(http://colorconsole.googlecode.com/files/colorconsole-$pkgver.zip)
md5sums=('fc9278f1795ff929b8e497f8081c1116')

build() {
  cd ${srcdir}/colorconsole-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1
}

