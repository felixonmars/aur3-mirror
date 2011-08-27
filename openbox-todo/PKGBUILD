# Maintainer: JHeaton <jheaton at archlinux dot us>
# Contributor: Cameron Turner (Kladiin)

pkgname=openbox-todo
pkgver=2
pkgrel=3
pkgdesc="A simple TODO list that integrates into the Openbox menu"
url="http://bbs.archlinux.org/viewtopic.php?id=91544"
arch=('any')
depends=('sh' 'zenity' 'sed')
license=('BSD')
source=('openbox-todo' 'LICENSE')
md5sums=('e85e57044eb1165138f8e66179528657'
         '8e773e32775fb019d2ed185754cdb2d4')
build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/openbox-todo
  install -m 755 openbox-todo $pkgdir/usr/bin/openbox-todo
  chmod +x $pkgdir/usr/bin/openbox-todo
  install -m 755 LICENSE $pkgdir/usr/share/licenses/openbox-todo/LICENSE
}
