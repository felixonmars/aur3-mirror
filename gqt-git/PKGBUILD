 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=gqt-git
pkgver=96.4ab9821
pkgrel=1
pkgdesc="a set of shim headers to compile GTK applications with Qt"
arch=('any')
url="https://gitorious.org/gqt/gqt"
#other interesting resources
#http://www.thelins.se/johan/2010/01/gtk-made-qt.html
#http://wiki.lxde.org/en/Migrate_from_GTK+_to_Qt
license=('unknown')
# no license is given
depends=('qt4')
# I might try to update to qt5
makedepends=('git')
source=('gqt'::'git://gitorious.org/gqt/gqt.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/gqt
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


#build() {
#  cd $srcdir/gqt
#
#}

package() {
  cd $srcdir/gqt
  mkdir -p $pkgdir/usr/include/gqt/gtk 
  cp gtk/*.h $pkgdir/usr/include/gqt/gtk/
}
 
