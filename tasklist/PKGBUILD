# Contributor: Gary James <garyjames82@gmail.com>
pkgname=tasklist
pkgver=0.5
pkgrel=1
pkgdesc="Tasklist applet for rox panel"
arch=('i686')
url="ftp://ftp.berlios.de/pub/rox4debian/apps/Tasklist-0.5.tgz"
license=('GPL')
depends=(rox libwnck)
source=(ftp://ftp.berlios.de/pub/rox4debian/apps/Tasklist-$pkgver.tgz)
md5sums=('fd5d194077f36bac88c5ca85267cbf52')

build() {
  cd "$srcdir/Tasklist"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
  mkdir "$pkgdir/usr/bin"
  echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
  echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
