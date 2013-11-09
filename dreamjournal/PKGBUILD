# Maintainer: gh0st85 <kasper.menten@gmx.com)
# Submitter: scrawl <scrawl@baseoftrash.de>

pkgname=dreamjournal
pkgver=2.5
pkgrel=2
pkgdesc="program for recording dreams and improving dream recall (freeware)"
arch=('i686' 'x86_64')
url="http://www.banhurt.com/dreamjournal/"
license=('Freeware')
depends=('mono')
source=('dreamjournal.desktop'
        'http://www.xjimx.com/hosted/dj25/DreamJournal.7z'
        'icon.png')
md5sums=('89f085f7520f96938d0b37646a5c4326'
         '57524a9f0df95a1c40258f465299cf44'
         '4b0de26fe8bc7d0e79a18e43a2283796')


build() {
  cd $srcdir
  install -D $srcdir/dreamjournal.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D $srcdir/icon.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D $srcdir/DreamJournal.exe $pkgdir/usr/lib/dreamjournal/$pkgname.exe
}
