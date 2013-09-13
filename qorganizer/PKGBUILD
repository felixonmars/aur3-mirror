# Maintainer: Uroc327 <uroc327@cssbook.de>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=qorganizer
_pkgname=qOrganizer
pkgver=3.1.5
_pkgver=3.1-5
pkgrel=6
pkgdesc="A general organizer that includes a calendar with schedule,reminders,journal/notes for every day, to-do list"
arch=('i686' 'x86_64')
url="http://qorganizer.sourceforge.net/"
license=('GPL')
depends=('qt4')
optdepends=('sqlite3: store data in sqlite database'
            'mysql: store data in mysql database')
source=(http://downloads.sourceforge.net/$pkgname/$_pkgname-v$_pkgver.tar.gz
        qorganizer.desktop)
md5sums=('f4248db092591c37b3b3d94a965acc4d'
         'd161319560f1ac3198ed714dddb9dd73')

build() {
  cd "$srcdir/$_pkgname-v$_pkgver/src"

  qmake-qt4
  make
}

package() {
  cd "$srcdir/$_pkgname-v$_pkgver"

  install -Dm755 qOrganizer "$pkgdir/usr/bin/qorganizer"
  install -Dm644 qOrganizer.png "$pkgdir/usr/share/pixmaps/qorganizer.png"
  install -Dm644 ../qorganizer.desktop "$pkgdir/usr/share/applications/qorganizer.desktop"
}
