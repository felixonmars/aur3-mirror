# Author: Dmitriy Smirnov <other@igus.lv>
pkgname=mountray
pkgver=0.1
pkgrel=1
pkgdesc="Mountray - tray mounter for hot-pluggable devices. gvfs version"
arch=('any')
depends=('gvfs' 'udisks' 'libnotify')
license=("GPL")
url="https://github.com/DimaSmirnov/mountray"
source=("http://www.igus.lv/mountray/mountray.tar.xz")
md5sums=('9f1c58386b1692156229fd72dc93d254')

build() {
  cd "$srcdir"
 make
}
package() {
  cd "$srcdir"
  install -D mountray "$pkgdir/usr/bin/mountray"
  install -d "$pkgdir/usr/share/pixmaps/mountray/"
  cd "$srcdir/icons"
  install -D * "$pkgdir/usr/share/pixmaps/mountray/"
}

md5sums=('3a41efc0c89b21251740a360d7b94fa3')
