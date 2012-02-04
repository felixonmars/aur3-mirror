# Contributor: Gary James <garyjames82@gmail.com>
pkgname=tail
pkgver=2.1.4
pkgrel=1
pkgdesc="Tail applet for the rox desktop"
arch=('i686')
url="http://www.kerofin.demon.co.uk/rox/tail.html"
license=('GPL')
depends=(rox-clib)
source=(http://www.kerofin.demon.co.uk/rox/Tail-$pkgver.tar.gz)
md5sums=('3e747786e79bda9d3f3443386b604bf7')

build() {
  cd "$srcdir/Tail"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
  cd "$pkgdir/usr/share/$pkgname"
  ./AppRun --compile
  mkdir "$pkgdir/usr/bin"
  echo "#!/bin/bash" > $pkgdir/usr/bin/x$pkgname
  echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/x$pkgname
  chmod +x $pkgdir/usr/bin/x$pkgname
}

# vim:set ts=2 sw=2 et:
