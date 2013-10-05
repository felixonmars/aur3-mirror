# Maintainer: René Herman <rene dot herman at gmail dot com>

pkgname=lxdmflexiserver
pkgver=1.0.0
pkgrel=1
pkgdesc="Shell script to relay gdmflexiserver calls, such as from the Xfce Action Buttons panel plugin's Switch User command, to lxdm"
arch=('any')
url="https://wiki.archlinux.org/index.php/LXDM#Simultaneous_users_and_switching_users"
license=('custom: Public Domain')
source=(gdmflexiserver)
md5sums=('fc918a32996f48deb8b07c70d7c3890a')

package() {
  install -D "$srcdir/gdmflexiserver" "$pkgdir/usr/bin/gdmflexiserver"
}

# vim:set ts=2 sw=2 et:
