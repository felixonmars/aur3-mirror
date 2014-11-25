# Maintainer: Demetri0 <d3i0@ya.ru>
pkgname=databaseanime
pkgver=260.465a879
pkgrel=1
pkgdesc="Management of your collection anime, manga, amv, dorama"
arch=('i686' 'x86_64')
url="https://github.com/LibertaSoft/DatabaseAnime"
license=('GPLv3')
makedepends=('git' 'make')
depends=('qt5-base>=5.3' 'qt5-translations' 'sqlite>=3.7.9' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=('databaseanime')
provides=('databaseanime')
options=()
install=databaseanime.install
source=(.AURINFO
        "$pkgname"::'git+https://github.com/LibertaSoft/DatabaseAnime.git')
md5sums=('77fb103e0910404d0332a03b646d7bdb'
         'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"

  mkdir build && cd build
  qmake .. -config release
  make
  lrelease ../DatabaseAnime.pro
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/apps
  mkdir -p images/DBA_Icon.png $pkgdir/usr/share/pixmaps

  cd "$srcdir/$pkgname"
  cp DatabaseAnime_ru.qm $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  cp DatabaseAnime_en.qm $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  cp qtbase_ru.qm $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  
#  cp ../../DatabaseAnime.desktop $pkgdir/usr/share/applications/DatabaseAnime.desktop
# [Generate file DatabaseAnime.desktop]
  echo "[Desktop Entry]" > $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Version=1.2.0" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Type=Application" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Name=Database Anime" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Comment=Management of your anime, manga, amv and dorama." >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Comment[ru]=Систематизация вашей коллекции Аниме, Манги, amv и Дорамы." >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "TryExec=dba" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Exec=dba %u" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Icon=DatabaseAnime" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Categories=Database;Qt;Anime" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "Terminal=false" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  echo "MimeType=x-scheme-handler/DatabaseAnime;" >> $pkgdir/usr/share/applications/DatabaseAnime.desktop
  
  cp images/DBA_Icon-64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/DatabaseAnime.png
  cp images/DBA_Icon.png $pkgdir/usr/share/icons/hicolor/128x128/apps/DatabaseAnime.png
  cp images/DBA_Icon-256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/DatabaseAnime.png
  cp images/DBA_Icon-512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/DatabaseAnime.png
  
  cp images/DBA_Icon.png $pkgdir/usr/share/pixmaps/DatabaseAnime.png

  cd build
  cp DatabaseAnime $pkgdir/usr/bin/dba
#  cp $pkgname $pkgdir/usr/bin/DatabaseAnime
  
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
