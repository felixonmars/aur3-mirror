# $Id: PKGBUILD 111081 2011-02-23 22:48:06Z paul $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dnsmasq-dbus
_pkgname=dnsmasq
pkgver=2.57
pkgrel=1
pkgdesc="Lightweight, easy to configure DNS forwarder and DHCP server"
url="http://www.thekelleys.org.uk/dnsmasq/doc.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'bash' 'dbus-core')
makedepends=('libcap>=2.16')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/dnsmasq.conf')
source=("http://www.thekelleys.org.uk/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('d10faeb409717eae94718d7716ca63a4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # link against dbus
  echo '#define HAVE_DBUS' >> src/config.h

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/var/{db,lib/misc}
  install -Dm644 "dbus/dnsmasq.conf" "$pkgdir/etc/dbus-1/system.d/dnsmasq.conf"
  install -Dm644 'dnsmasq.conf.example' "$pkgdir/etc/dnsmasq.conf"

  # enable dbus by default
  printf '\n%s\n' 'enable-dbus' >> "$pkgdir/etc/dnsmasq.conf"
}

# vim: ts=2 sw=2 et ft=sh
