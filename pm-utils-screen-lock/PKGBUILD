# Contributor: Byron Clark <byron@theclarkfamily.name>
pkgname=pm-utils-screen-lock
pkgver=0.1.2
pkgrel=1
pkgdesc="Lock the screen on suspend/hibernate"
url="http://byron.theclarkfamily.name/"
license=('MIT')
arch=('any')
depends=('pm-utils')
source=('video-lock-screen')
md5sums=('98d0963134dbff8cd6feab273455a42c')
install=$pkgname.install

build() {
  install -D -m 0755 $srcdir/video-lock-screen $pkgdir/usr/lib/pm-utils/sleep.d/00lock-screen
}
# vim: set ft=sh ts=2 sw=2 et:
