# Maintainer: M Rawash <mrawash@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=labyrinth
pkgver=0.6
pkgrel=1
pkgdesc="A lightweight mind-mapping tool with support for image import and drawing"
arch=('any')
url="http://code.google.com/p/labyrinth/"
license=('GPL')
depends=('pygtk' 'python2-gobject2' 'python2-xdg' 'python2-numpy' 'python2-gconf')
makedepends=('intltool')
install=$pkgname.install
source=(https://github.com/labyrinth-team/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('e008ebfc1eaeab7f40cff05cb1865c45')

build() {
  cd $srcdir/$pkgname-$pkgver

    #use python2
    for i in `grep -Rl "/usr/bin/env" *`;do sed -i 's/python/python2/' $i;done

    msg "Running setup.py..."
    python2 setup.py -q install --root="${pkgdir}" --optimize=1
}
