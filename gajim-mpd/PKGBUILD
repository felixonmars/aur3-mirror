# Contributor: Michael Pappe <maikeru@online.de>

pkgname=gajim-mpd
pkgver=0.12.3
pkgrel=1
pkgdesc="Jabber client written in PyGTK. With MPD-Patch for musictracker"
arch=(i686 x86_64)
url="http://www.gajim.org/"
license=('GPL3')
depends=('gtkspell' 'sqlite3' 'dnsutils' 'pygtk' 'libxss' 'python>=2.5' 'python-mpd')
makedepends=('gettext' 'intltool' 'dbus')
optdepends=('dbus-python')
options=(!libtool)
source=(http://www.gajim.org/downloads/gajim-${pkgver}.tar.gz \
	'mpd.patch')

md5sums=('088ebbcd8cb4242452831bee5de70639'
         '23bb4e3af0e8d5a2db30d011e74c177f')

build() {
  cd "${srcdir}/gajim-${pkgver}"
  patch -Np0 -i ${srcdir}/mpd.patch

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  find "${pkgdir}/usr/share/gajim/" -name "*.pyo" | xargs rm -rf
}

