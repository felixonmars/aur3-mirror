# Contributor: Thomas G. <tg1311@users.sourceforge.net>
# Maintainer: tg1311

pkgname=openspeak-client
_realpkgname=openspeak
pkgver=0.1rc2
_realpkgver=0.1-rc2
pkgrel=1
pkgdesc="openSpeak is a VoIP solution mainly aimed at gamers"
arch=('i686')
url="http://openspeak-project.org/"
license=('GPL')
depends=('speex' 'wxgtk' 'portaudio')
source=("http://downloads.sourceforge.net/openspeak/openspeak-$_realpkgver.tar.gz" \
	openspeak.desktop)
md5sums=('e09ca5d336d1fb3f381b5bea1e9a55a9' \
	 '04c4e9ef92847db72ad65adb33546b59')


build() {
  cd "$srcdir/$_realpkgname-$_realpkgver"

  ./configure --prefix=/usr
  make || return 1
  install -m755 -D $startdir/src/openspeak-0.1-rc2/client/openspeak $startdir/pkg/usr/bin/openspeak
  install -m644 -D $startdir/openspeak.desktop $startdir/pkg/usr/share/applications/openspeak.desktop
  install -m755 -d $startdir/pkg/usr/share/man/man1
  install -m644 -D $startdir/src/openspeak-0.1-rc2/openspeak.1 $startdir/pkg/usr/share/man/man1/
  install -m644 -D $startdir/src/openspeak-0.1-rc2/logo.xpm $startdir/pkg/usr/share/pixmaps/openspeak.xpm
}