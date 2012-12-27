# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-weather
pkgver=0.2
pkgrel=1
pkgdesc="Access current weather conditions and forecasts"
arch=('any')
url="http://git.gnome.org/browse/gnome-weather/"
license=('GPL')
depends=('python-gobject' 'clutter-gtk' 'libgweather')
makedepends=('intltool')
source=(http://pkgbuild.com/~bgyorgy/sources/$pkgname-$pkgver.tar.xz
        backport-libgweather.patch)
sha256sums=('fd724d7c013e6faf58284aa2543a6e4d5cb182f2563e8fcc47023d0740d835ea'
            '17f09f40d445e0d66739c4d463dea5228e919db7581ac160b2ae9926d0b384af')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Do not use libgweather features newer than version 3.6
  patch -Np1 -i "$srcdir/backport-libgweather.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
