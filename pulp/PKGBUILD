# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>, Maintainer: Manuel Bärenz <manuel@enigmage.de>
pkgname=pulp
pkgver=1.5.3
pkgrel=3
pkgdesc="A Linear Programming modeler written in python"
url="http://code.google.com/p/pulp-or"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2>=2.5' 'python2-pyparsing')
source=(http://pulp-or.googlecode.com/files/PuLP-$pkgver.tar.gz)
md5sums=('58901466ca22f87098303683a87cb466')

build() {
  cd $srcdir/PuLP-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
  # Removes /usr/bin/test because of conflicts
  rm -rfv $pkgdir/usr/bin
} 
