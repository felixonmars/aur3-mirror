# Contributor: Gary James <garyjames82@gmail.com>
pkgname=edit
pkgver=2.1
pkgrel=1
pkgdesc="Simple Editor for the ROX Desktop"
arch=('i686')
url="http://roscidus.com/desktop/Edit"
license=('GPL')
depends=(rox-lib)
source=(http://downloads.sourceforge.net/project/rox/Edit/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('e3a29bd0e1183fd10c5a4a2da21dc0e5')

build() {
  cd "$srcdir/$pkgname-$pkgver/Edit"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
  echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
