# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=xf86-video-intel-conf-sna
pkgver=1
pkgrel=1
pkgdesc="Xorg conf file for Intel graphics driver to enable SNA"
arch=('any')
url="http://xorg.freedesktop.org/"
license=('GPL')
depends=("xf86-video-intel")
source=(
  '20-intel.conf'
)

package() {
  install -Dm644 "$srcdir/20-intel.conf" "$pkgdir/etc/X11/xorg.conf.d/20-intel.conf"
}

sha512sums=('08e7d453072937223941a01bbbb72ee32a89f72f4b3b141e3e96946a19a83634911a6608b74f92668d04eeb88013f6cb89b3abd41195f4431dfbf23b0a1a0891')
