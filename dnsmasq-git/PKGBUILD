# Maintainer: Evan Callicoat <apsu@propter.net>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dnsmasq-git
_gitname=dnsmasq
pkgver=v2.67test7.2.g625ac28
pkgrel=1
pkgdesc="Lightweight, easy to configure DNS forwarder and DHCP server"
url="http://www.thekelleys.org.uk/dnsmasq/doc.html"
arch=('i686' 'x86_64')
license=('GPL')
provides=('dnsmasq')
conflicts=('dnsmasq')
depends=('glibc' 'dbus-core')
makedepends=('git' 'perl')
install=dnsmasq.install
backup=('etc/dnsmasq.conf')
source=('git://thekelleys.org.uk/dnsmasq.git'
        'dnsmasq.service')
md5sums=('SKIP'
         '7ac45726cabef4145db40d758cc7fedf')

pkgver() {
  cd "$_gitname"
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_gitname"

  # link against dbus. this ugliness is needed to ensure that the
  # compile time opts report properly on startup. yuck.
  sed -i '/^#ifdef DNSMASQ_COMPILE_OPTS/ i#define HAVE_DBUS' src/config.h

  make "CFLAGS=$CPPFLAGS $CFLAGS" "LDFLAGS=$LDFLAGS"
}

package() {
  cd "$_gitname"

  make BINDIR=/usr/bin PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 "dbus/dnsmasq.conf" "$pkgdir"/etc/dbus-1/system.d/dnsmasq.conf
  install -Dm644 "dnsmasq.conf.example" "$pkgdir"/etc/dnsmasq.conf
  install -Dm644 "$srcdir/dnsmasq.service" "$pkgdir"/usr/lib/systemd/system/dnsmasq.service
}

# vim: ts=2 sw=2 et ft=sh
