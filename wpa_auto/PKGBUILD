# Contributor: Filip Wojciechowski <filip at loka dot pl>
pkgname=wpa_auto
pkgver=0.9.5
pkgrel=1
pkgdesc="A script to automatically connect to wireless networks using wpa_supplicant"
url="http://bbs.archlinux.org/viewtopic.php?id=59004"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dhcpcd' 'iproute2' 'wpa_supplicant')
backup=(etc/conf.d/wpa_auto)
install='wpa_auto.install'
source=(wpa_auto wpa_auto.conf wpa_auto_action)

build() {
  cd $srcdir
  install -D -m755 wpa_auto ${pkgdir}/etc/rc.d/wpa_auto || return 1
  install -D -m755 wpa_auto_action ${pkgdir}/usr/bin/wpa_auto_action || return 1
  install -D -m644 wpa_auto.conf ${pkgdir}/etc/conf.d/wpa_auto || return 1
}

md5sums=('73487ed239518a6936d1414b7fdd8c1a'
         '9509b70c2b83e9eeeb67a15e3c6bdff4'
         'd546c1c92919a4e0633d13888e388275')
