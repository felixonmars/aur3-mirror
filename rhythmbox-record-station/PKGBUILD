# Contributor: scrawl <scrawl@baseoftrash.de>

pkgname=rhythmbox-record-station
pkgver=1.3.3
pkgrel=1
pkgdesc="plugin for the rhythmbox music player to rip internet radio, based on streamripper"
arch=('i686' 'x86_64')
url="http://scrawl.bplaced.net/projects/record-station"
license=('GPL2')
depends=('rhythmbox' 'streamripper' 'pygtk' 'pygobject' 'libnotify')
optdepends=('mplayer')
makedepends=()
source=('http://scrawl.bplaced.net/projects/record-station/download.php?file=tgz')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/record-station
  mkdir -p $pkgdir/usr/share/locale
  
  cp -R $srcdir/usr/lib/rhythmbox/plugins/record-station $pkgdir/usr/lib/rhythmbox/plugins/
  cp -R $srcdir/usr/share/locale/ $pkgdir/usr/share/
}
md5sums=('00a32f2a26b27b5e7715874880f2cb5e')
