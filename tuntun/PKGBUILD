# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=tuntun
pkgver=0.4.0
pkgrel=1
pkgdesc="An applet for Gnome panel that can manage a list of vpn connections"
arch=('i686')
url="http://code.google.com/p/tuntun/"
license=('GPL2')
depends=('openvpn' 'gnome-panel' 'libnotify')
makedepends=('intltool' 'pkgconfig')
source=(http://tuntun.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('8a6ee39d0d63d89914f9b4f49e62ef8c')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr --libexec=/usr/lib/gnome-applets
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
