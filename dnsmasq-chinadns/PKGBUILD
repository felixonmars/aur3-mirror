# Maintainer: banbanchs <memory.silentvoyage@gmail.com>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=dnsmasq-chinadns
_gitname=dnsmasq
_patchname=openwrt-dnsmasq
pkgver=2.72
pkgrel=2
pkgdesc="A patched version of dnsmasq which filters out some suspicious IP"
url="https://github.com/styx-hy/dnsmasq-chinadns"
arch=('i686' 'x86_64')
license=('GPL')
provides=('dnsmasq')
conflicts=('dnsmasq')
depends=('glibc' 'libdbus' 'gmp' 'nettle')
install=$pkgname.install
backup=('etc/dnsmasq.conf' 'etc/dnsmasq.d/dnsmasq-chinadns.conf')
source=("http://thekelleys.org.uk/dnsmasq/dnsmasq-2.72.tar.gz"
        "git://github.com/aa65535/openwrt-dnsmasq.git"
        "dnsmasq.service"
        "dnsmasq-chinadns.conf"
        "dnsmasq-chinadns.install"
        "dnsmasq.resolv.conf"
        "spurious_ips.conf")
md5sums=('SKIP'
         'SKIP'
         '7ac45726cabef4145db40d758cc7fedf'
         '176e6b601a1ab911145d9210a0182707'
         '629a52f5272e6e7330e1783cdf7e061a'
         '784196fac41da56c6ea7af6f42aa7e3b'
         'cfac71078db1207d51167d4e0eb3edf3')

build() {
  cd "$srcdir/$_gitname-$pkgver"
  patch -p1 < ../$_patchname/patches/001-feature-enhancement.patch
  patch -p1 < ../$_patchname/patches/100-fix-dhcp-no-address-warning.patch
  patch -p1 < ../$_patchname/patches/110-ipset-remove-old-kernel-support.patch

  make \
    CFLAGS="$CPPFLAGS $CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    COPTS="-DHAVE_DNSSEC -DHAVE_DBUS"
}

package() {
  cd "$srcdir/$_gitname-$pkgver"

  make BINDIR=/usr/bin PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 "dbus/dnsmasq.conf" "$pkgdir"/etc/dbus-1/system.d/dnsmasq.conf
  install -Dm644 "dnsmasq.conf.example" "$pkgdir"/etc/dnsmasq.conf
  install -Dm644 "$srcdir/dnsmasq.service" "$pkgdir"/usr/lib/systemd/system/dnsmasq.service
  install -Dm644 "$srcdir/spurious_ips.conf" "$pkgdir"/etc/spurious_ips.conf
  install -Dm644 "$srcdir/dnsmasq.resolv.conf" "$pkgdir"/etc/dnsmasq.resolv.conf
  mkdir -p "$pkgdir"/etc/dnsmasq.d
  install -Dm644 "$srcdir/dnsmasq-chinadns.conf" "$pkgdir"/etc/dnsmasq.d/dnsmasq-chinadns.conf

  # DNSSEC setup
  sed -i 's,%%PREFIX%%,/usr,' "$pkgdir"/etc/dnsmasq.conf
  install -Dm644 "trust-anchors.conf" "$pkgdir"/usr/share/dnsmasq/trust-anchors.conf
}

# vim: ts=2 sw=2 et ft=sh
