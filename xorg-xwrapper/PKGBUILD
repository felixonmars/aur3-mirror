# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Alad Wenter
pkgname=xorg-xwrapper
pkgver=1
pkgrel=1
pkgdesc="Enable root privileges for Xorg"
arch=('any')
url="https://wiki.archlinux.org/index.php/Xorg#Rootless_Xorg_.28v1.16.29"
license=('GPL')
depends=('xorg-server')
source=('Xwrapper.config')
md5sums=('22bb355f4c3bcf2aa837f212607dabc6')

package() {
  mkdir -p "$pkgdir/etc/X11"
  install -m644 Xwrapper.config "$pkgdir/etc/X11"
}

# vim:set ts=2 sw=2 et:
