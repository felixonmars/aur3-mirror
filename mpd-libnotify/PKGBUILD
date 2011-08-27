pkgname=mpd-libnotify
pkgver=0.1.2
pkgrel=1
pkgdesc="A libnotify interface for mpd"
arch=('i686' 'x86_64')
license=('GPL')
url="http://musicpd.org"
depends=('libmpd' 'libnotify')
source=(http://nealylitalo.net/mpd-libnotify/${pkgname}-${pkgver}.tar.bz2)
md5sums=(bf866cb20ab96327c796a241b047888c)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
