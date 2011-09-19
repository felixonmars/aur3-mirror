# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=converseen
pkgver=0.4.6
pkgrel=2
pkgdesc="The batch image converter and resizer. It supports more than 100 image formats."
arch=('i686' 'x86_64')
url="http://converseen.sourceforge.net/"
license=('GPL2')
depends=('graphicsmagick' 'imagemagick' 'openexr' 'qt')
source=(http://downloads.sourceforge.net/sourceforge/converseen/converseen-$pkgver.tar.bz2)
md5sums=('07c876b52e1982b8b2493c3aea3c3071')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Build
  qmake
  make

  # Binary
  install -Dm755 converseen $pkgdir/usr/bin/converseen

  # Translations
  cd ./loc
  for file in $(find . -name '*.qm' -print); do
  install -Dm644 $file $pkgdir/usr/share/converseen/$file
  done

  # Desktop icon
  cd ../res
  install -Dm644 converseen.png     $pkgdir/usr/share/pixmaps/converseen.png
  install -Dm644 converseen.desktop $pkgdir/usr/share/applications/converseen.desktop

  # KDE4 Servicemenu
  install -Dm644 converseen_import.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/converseen_import.desktop
}