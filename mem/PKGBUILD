# Contributor: Gary James <garyjames82@gmail.com>
pkgname=mem
pkgver=2.1.5
pkgrel=1
pkgdesc="Memory applet for the rox desktop"
arch=('i686')
url="http://www.kerofin.demon.co.uk/rox/mem.html"
license=('GPL')
depends=(rox-clib libgtop)
source=(http://www.kerofin.demon.co.uk/rox/Mem-$pkgver.tar.gz)
md5sums=('341842ff1f6c76474e81c4e2e00fde85')

build() {
  cd "$srcdir/Mem"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
  cd "$pkgdir/usr/share/$pkgname"
  ./AppRun --compile
  mkdir "$pkgdir/usr/bin"
  echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
  echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
