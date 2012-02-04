# Contributor: sickhate <vivid@tux-linux.net>

pkgname=mplayer-snapshot
pkgver=0.3
pkgrel=1
pkgdesc="Creating one big thumbnail from movie using mplayer"
arch=('i686')
url="http://www.gnomefiles.org/app.php/mplayer-snapshot"
license=('GPL')
depends=('mplayer' 'cairo' 'gtk' 'gdk-pixbuf' 'glib')
source=('http://mplayer-snapshot.googlecode.com/files/mplayer-snapshot-0.3.tar.bz2')
md5sums=('0350b62b8ddddb767d66f1c0fabdd661')


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
