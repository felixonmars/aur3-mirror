# Contributor: Karol Cichy <slothck@gmail.com> 

pkgname=conky-tui
_pkgname=conky
pkgver=1.8.1
pkgrel=1
pkgdesc="Conky command line, without X11 dependencies, with extra features enabled"
arch=(i686 x86_64)
url="http://conky.sourceforge.net/"
license=("custom")
replaces=('torsmo')
provides=('conky')
conflicts=('conky')
depends=('glib2' 'lua' 'wireless_tools' 'libxml2' 'curl')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('9581419b1a53a8a7e37b0291cd4e55ab166d221a')

build() {
  cd $srcdir/conky-$pkgver

  patch -p1 -i ../conky-1.8.1-nvidia-x.patch || return 1

  ./configure \
  --prefix=/usr \
  --sysconfdir=/etc \
  --enable-lua \
  --disable-lua-cairo \
  --disable-double-buffer \
  --disable-x11 \
  --disable-xdamage \
  --disable-own-window \
  --disable-xft \
  --enable-hddtemp \
  --enable-portmon \
  --enable-ibm \
  --enable-curl \
  --enable-rss \
  --enable-nvidia \
  --enable-weather-xoap \
  --enable-weather-metar \
  --enable-ncurses \
  --enable-wlan

  make || return 1
  make DESTDIR=$pkgdir install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

