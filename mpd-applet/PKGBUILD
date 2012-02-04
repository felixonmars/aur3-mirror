pkgname=mpd-applet
pkgver=0.1
pkgrel=1
pkgdesc="A Gnome Panel applet for MPD"
arch=('i686')
url="https://svn.musicpd.org/mpd-applet/releases/0.1/"
license=('GPL')
depends=('')
makedepends=()
provides=('')
conflicts=('')
source=(https://svn.musicpd.org/mpd-applet/releases/0.1/mpd-applet_$pkgver-$pkgrel.tar.gz)
md5sums=(ee42a56205a98655451b8a63690074f6)

build() {
  cd ${srcdir}/trunk
  ./configure
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
