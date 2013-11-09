# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromiumos-xorg-conf-daisy
pkgdesc="Chromium OS audio server"
pkgver=R30.4537
pkgrel=1
arch=('any')
groups=('chromarchy')
url="http://git.chromium.org/gitweb/?p=chromiumos/platform/xorg-conf.git;a=summary"
license=('custom:chromiumos')
_gitname='xorg-conf'
makedepends=('chromiumos-overlay')
provides=('chromiumos-xorg-conf')

source=("$_gitname::git+http://git.chromium.org/git/chromiumos/platform/xorg-conf.git#branch=release-R30-4537.B")

md5sums=('SKIP')

package() {
  cd ${srcdir}/$_gitname

  install -d ${pkgdir}/etc/X11
  install -m 644 xorg.conf ${pkgdir}/etc/X11

  install -d ${pkgdir}/etc/X11/xorg.conf.d
  install -m 644 exynos.conf ${pkgdir}/etc/X11/xorg.conf.d
  install -m 644 50-touchpad-cmt.conf ${pkgdir}/etc/X11/xorg.conf.d
  install -m 644 50-touchpad-cmt-daisy.conf ${pkgdir}/etc/X11/xorg.conf.d
  install -m 644 20-mouse.conf ${pkgdir}/etc/X11/xorg.conf.d
  install -m 644 20-touchscreen.conf ${pkgdir}/etc/X11/xorg.conf.d
}
