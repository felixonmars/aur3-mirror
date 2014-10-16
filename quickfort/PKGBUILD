# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>
pkgname=quickfort
pkgver=2.04
pkgrel=1
pkgdesc="A Dwarf Fortress utility for building forts from blueprint .CSV files"
arch=('any')
url="http://www.joelpt.net/quickfort/"
license=('Apache')
depends=('python2') 
provides=('quickfort')
source=(https://github.com/downloads/joelpt/quickfort/Quickfort_$pkgver.zip)
md5sums=('aabd576ffb962b28dd86944a6ba9f2ae')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's/\/bin\/python/\/bin\/python2/' src/qfconvert/qfconvert.py 
  chmod +x src/qfconvert/qfconvert.py
}

package() {
  cd "$srcdir/$pkgname"
  mkdir --parents $pkgdir/usr/share/quickfort/
  cp -r src/qfconvert/* $pkgdir/usr/share/quickfort/
  mkdir --parents $pkgdir/usr/bin/
  touch $pkgdir/usr/bin/qfconvert
  echo "#!/bin/bash" >> $pkgdir/usr/bin/qfconvert
  echo '/usr/share/quickfort/qfconvert.py "$@"' >> $pkgdir/usr/bin/qfconvert
  chmod +x $pkgdir/usr/bin/qfconvert
}

# vim:set ts=2 sw=2 et:
