# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=silicon
pkgver=1.2.0
pkgrel=4
pkgdesc="CD/DVD image manager and mounter."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=106128"
license=('GPL3')
depends=('qt4')
source=(http://www.kde-apps.org/CONTENT/content-files/106128-silicon.tar.gz)
md5sums=('36cd49d07defb9510a68469f143334b3')

prepare() {
  cd $srcdir/$pkgname

  # Use qmake-qt4 
  sed -i "s|qmake|qmake-qt4|" Makefile
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname

  # Binary
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

  # Configuration Files
  cd ./files
  install -Dm644 ./share/config $pkgdir/usr/share/$pkgname/config
  install -Dm644 config $pkgdir/etc/$pkgname/config
  install -Dm644 database $pkgdir/etc/$pkgname/database

  # Desktop Icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png $pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png
}