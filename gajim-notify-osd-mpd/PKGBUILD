# Contributor: Michael Pappe <maikeru@online.de>

pkgname=gajim-notify-osd-mpd
_pkgname=gajim
provides=gajim
replaces=gajim
pkgver=0.12.3
pkgrel=1
pkgdesc="Jabber client written in PyGTK. With MPD-Patch for musictracker"
arch=(i686 x86_64)
url="http://www.gajim.org/"
license=('GPL')
depends=('gtkspell' 'sqlite3' 'dnsutils' 'pygtk' 'libxss' 'python>=2.5' 'python-mpd')
makedepends=('intltool' 'gettext' 'perlxml' 'dbus')
optdepends=('dbus-python')
options=(!libtool)
source=(http://www.gajim.org/downloads/$_pkgname-$pkgver.tar.gz \
        'osd.patch' \
	'mpd.patch')

md5sums=('088ebbcd8cb4242452831bee5de70639'
         '183e6a75713affb226c23dc8860b2539'
         '23bb4e3af0e8d5a2db30d011e74c177f')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  patch -Np0 -i ${srcdir}/osd.patch
  patch -Np0 -i ${srcdir}/mpd.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  cd $startdir/pkg/usr/share/$_pkgname/
  find . -name "*.pyo" | xargs rm -rf
}


