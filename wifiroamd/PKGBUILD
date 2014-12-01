# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wifiroamd
pkgver=1.15
pkgrel=2
pkgdesc="Automatic wifi connection (re)establishment daemon"
arch=('any')
url="http://www.tummy.com/Community/software/wifiroamd/"
license=('GPL')
depends=('dhclient' 'fping' 'python2' 'wireless_tools')
source=(ftp://ftp.tummy.com/pub/tummy/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.rc)
md5sums=('04a50f1808c378f939e8bdf0d1c091af'
         'e0fceb54c29c0bf259a88329db485d68')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $pkgname
  sed -i 's|python|python2|' $pkgname.init
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -D -m755 $pkgname       "${pkgdir}"/usr/bin/$pkgname
  install -D -m644 $pkgname.8     "${pkgdir}"/usr/share/man/man8/$pkgname.8
  install -D -m744 $pkgname.daily "${pkgdir}"/etc/cron.daily/$pkgname

## Mostly unnecessary, only flag that can be set is verboseness
  #install -D -m644 "$pkgname.sysconfig" "${pkgdir}/etc/conf.d/$pkgname"

  install -d "${pkgdir}"/etc/$pkgname/seen \
             "${pkgdir}"/etc/$pkgname/connections/{default.d,nowireless.d} \
             "${pkgdir}"/etc/$pkgname/scripts/{down.d,monitor_pinggw.d,reset.d,up.d} \
             "${pkgdir}"/var/lib/$pkgname/dhclient-leases

  install -m755 scripts/down.d/*           "${pkgdir}"/etc/$pkgname/scripts/down.d
  install -m755 scripts/monitor_pinggw.d/* "${pkgdir}"/etc/$pkgname/scripts/monitor_pinggw.d
  install -m755 scripts/reset.d/*          "${pkgdir}"/etc/$pkgname/scripts/reset.d
  install -m755 scripts/up.d/*             "${pkgdir}"/etc/$pkgname/scripts/up.d
  install -m755 connections/nowireless.d/* "${pkgdir}"/etc/$pkgname/connections/nowireless.d

  install -m644  config config-defaults "${pkgdir}"/etc/$pkgname

  install -Dm755 "${srcdir}"/$pkgname.rc "${pkgdir}"/etc/rc.d/$pkgname
}
