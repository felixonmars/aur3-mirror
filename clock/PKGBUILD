# Contributor: Gary James <garyjames82@gmail.com>
pkgname=clock
pkgver=2.1.7
pkgrel=1
pkgdesc="Clock applet for the rox desktop"
arch=('i686')
url="http://www.kerofin.demon.co.uk/rox/clock.html"
license=('GPL')
depends=(rox-clib)
source=(http://www.kerofin.demon.co.uk/rox/Clock-$pkgver.tar.gz)
md5sums=('8583aa25a668dcf0b189b95e11cc3cac')

build() {
  cd "$srcdir/Clock"
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
