# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qmediabibliothek
pkgver=0.3.1
pkgrel=2
pkgdesc="Database application for KDE4 to manage movies."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/QMediaBibliothek?content=109347"
license=('GPL2')
depends=('kdebase-workspace>4.2' 'phonon' 'qt4')
optdepends=('kaffeine' 'kdebase-konqueror' 'transcode' 'xine-ui')
source=(http://www.linux-specialist.com/download/source/QMediaBibliothek-$pkgver.tgz
        $pkgname.desktop)
md5sums=('2f598eae83a27393ea3b161326eebdc9'
         '15892d9c3d158094eb6d82ad03c95800')

build() {
  cd $srcdir/QMediaBibliothek-$pkgver

  qmake-qt4

  # Fix phonon path
  sed -i "s|/include/qt4/phonon|/include/phonon|" Makefile

  # Fix Kaffeine path
  sed -i "s|opt/kde3|usr|" src/QMediaBibliothek.cpp
  
  make
}

package() {
  cd $srcdir/QMediaBibliothek-$pkgver
  
  install -d $pkgdir/usr/share/qt4/translations
  install -d $pkgdir/usr/share/doc/qmediabibliothek
  install -Dm644 src/doc/*.html $pkgdir/usr/share/doc/qmediabibliothek
  install -Dm644 src/translations/*.qm $pkgdir/usr/share/qt4/translations
  install -Dm755 bin/QMediaBibliothek $pkgdir/usr/bin/QMediaBibliothek

  # Desktop icon
  install -Dm644 src/icons/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
