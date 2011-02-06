# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: defcon <defcon@archlinux.us>

pkgname=slackfire
pkgver='0.65.e'
pkgrel=1
pkgdesc="An iptables script to protect a stand-alone machine or a small network with a stateful firewall"
arch=(i686)
url="http://slackfire.berlios.de"
license=('GPL')
depends=(iptables)
backup=(etc/slackfire/slackfire.conf)
install="${pkgname}.install"
source=(ftp://ftp.berlios.de/pub/$pkgname/$pkgname-$pkgver-noarch-1.tgz
        slackfire slackfire-path.patch )
md5sums=('009531cb696373232235cb505bac9b05'
         'd1d6894a4abe4d506ec7ed48e307c4d9'
         'a4bbe946eb3a57c7702a94f9bc9235ef')
build() {
  tar zxf "$pkgname-$pkgver-noarch-1.tgz"
  cd "$srcdir"
  # fix variable PATH
  patch -p0 < "$srcdir/slackfire-path.patch" || return 1

  install -Dm755 usr/sbin/slackfire "$pkgdir/usr/sbin/slackfire"
  install -Dm755 usr/sbin/sf4sf     "$pkgdir/usr/sbin/sf4sf"

  find usr/doc/ -type f | while read fname; do
  install -Dm644 "$fname" "$pkgdir/usr/share/doc/$pkgname-$pkgver-$pkgrel/$(basename $fname)"
  done

  find usr/share/slackfire/ -type f | while read fname; do
  install -Dm644 "$fname" "$pkgdir/usr/share/slackfire/$(basename $fname)"
  done

  find etc/ -type f | while read fname; do
    install -Dm644 "$fname" "$pkgdir/${fname%.new}"
  done

  install -Dm755 slackfire "$pkgdir/etc/rc.d/slackfire"
}

# vim:set ts=2 sw=2 et:
