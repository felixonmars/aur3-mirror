# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: sickhate <sickhate@tux-linux.net>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>

pkgname=pigment-classic
_realname=pigment
pkgver=0.3.17
pkgrel=3
pkgdesc="A GLib/GObject library designed to easily create rich UIs embedding several media types, required by moovida-classic"
arch=('i686' 'x86_64')
url="https://code.fluendo.com/pigment/trac"
license=('GPL')
depends=('libgl' 'gstreamer0.10-base' 'gtk2')
options=('!libtool')
source=(http://elisa.fluendo.com/static/download/pigment/$_realname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_realname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
md5sums=('3b503a7fdc07c3bdfd7b1b96c61250aa')
