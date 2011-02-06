# Contributor: Madek <gonzaloseguel@gmail.com>

pkgname=notification-daemon-engine-slider
pkgver=0.2.0
pkgrel=3
pkgdesc="The Slider theme engine for the notification daemon"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/~mccann/notification-daemon-engine-slider"
license=('GPL3')
depends=('gtk2' 'notification-daemon')
source=(http://cgit.freedesktop.org/~mccann/notification-daemon-engine-slider/snapshot/notification-daemon-engine-slider-master.tar.bz2)
md5sums=('04fe21b537d79400881b4fca38496d33')

build() {
  cd "$srcdir/$pkgname-master"

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
