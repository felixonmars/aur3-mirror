# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alexej Magura <alexej*gmail*com>
pkgname=mlib
pkgver=1.1
pkgrel=1
pkgdesc="Detects whether multilib packages are installed, for use in PKGBUILDs"
arch=('any')
url="https://github.com/amagura/mlib"
license=('Apache')
depends=(bash)
source=(mlib)
md5sums=('5640eaa214a033caf278336020796d56')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/{bin,share/doc/"$pkgname"}
  install -m 755 -t "$pkgdir"/usr/bin "$pkgname"
}

# vim:set ts=2 sw=2 et:
