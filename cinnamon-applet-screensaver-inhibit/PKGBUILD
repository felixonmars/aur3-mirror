# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=cinnamon-applet-screensaver-inhibit
pkgver=1.2
pkgrel=1
pkgdesc="An applet to enable/disable screensaver"
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/59"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=(http://cinnamon-spices.linuxmint.com/uploads/applets/T5RT-8145-E67H.zip)

package() {
  find screen-inhibit\@mtwebster/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}

sha256sums=('33724d0c2b2db866f90044d28301f9d4286d187aacedd69c4839108edac2e561')
