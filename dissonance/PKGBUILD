# Contributor: Lyceuhns <lyceuhns at gmail.com>

pkgname=dissonance
pkgver=0.5.92
pkgrel=1
pkgdesc='"Fork" of Consonance Music manager (at the moment discontinued)'
arch=('i686' 'x86_64')
url="http://code.google.com/p/dissonance/"
license=('GPL')
depends=('gtk2' 'libao' 'taglib' 'libmad' 'sqlite3' 'dbus-glib' 'libnotify' 'flac' 'libsndfile' 'libvorbis' 'curl' 'libmodplug' 'libcdio' 'libcddb')
optdepends=('notification-daemon: OSD notification')
options=('docs')
source=(http://dissonance.googlecode.com/files/consonance-$pkgver.tar.gz)
md5sums=('88b555bc76426ed7d8910f3ab0caa9f5')

build() {
  cd $startdir/src/consonance-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -m 644 data/consonance.desktop ${startdir}/pkg/usr/share/applications
  install -d ${startdir}/pkg/usr/share/pixmaps
  install -m 644 data/consonance.png ${startdir}/pkg/usr/share/pixmaps/
  install -m 644 data/consonance.1 ${startdir}/pkg/usr/share/man/man1/
}
