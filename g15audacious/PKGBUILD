# Contributor: Fabian (dafab) Tiefert  <dafab at gmx dot com>
# Contributor: zoulnix <z[o]ulnix.borke[dd]uck.c[o]m>
pkgname=g15audacious
pkgver=2.5.7
pkgrel=2
pkgdesc="A very simple spectrum analyser and oscilloscoe for audacious."
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('audacious' 'g15daemon')
makedepends=('gcc' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/g15daemon/g15daemon-audacious-${pkgver}.tar.bz2)
md5sums=('817289b777c4973e9eeffad39d5a7caf')

build() {
  cd ${srcdir}/g15daemon-audacious-${pkgver}

  # fix audacious header...
  sed -i -e 's:playlist.h:playlist_container.h:' g15daemon_audacious_spectrum.c || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}