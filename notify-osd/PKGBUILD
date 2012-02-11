# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Johannes Pfau <johannespfau at gmail dot com>

pkgname=notify-osd
pkgver=0.9.33
pkgrel=1
pkgdesc="Canonical's on-screen-display notification agent, implementing the freedesktop.org Desktop Notifications Specification with semi-transparent click-through bubbles"
arch=('i686' 'x86_64')
url="https://launchpad.net/notify-osd"
license=('GPL')
depends=('libwnck3' 'dbus-glib>=0.76' 'dconf' 'gsettings-desktop-schemas')
makedepends=('libnotify>=0.7.0')
provides=('notification-daemon')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/precise/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('9e1be05db4fed8a3b3a0329a3a355b62')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Disable building tests
  sed -i '/SUBDIRS/ s/tests //' Makefile.in

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
