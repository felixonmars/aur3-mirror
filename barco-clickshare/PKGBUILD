# Maintainer: Will R (will digi-merc.org)
# Contributors: 

pkgname=barco-clickshare
pkgver=01.07.00.29
pkgrel=1
pkgdesc="Barco ClickShare wireless presentation system software"
arch=('x86_64')
url="http://www.barco.com/en/Products-Solutions/Presentation-collaboration/ClickShare-wireless-presentation-system/Full-featured-wireless-presentation-system-for-high-profile-meeting-rooms-and-boardrooms.aspx?#!downloads"
license=('proprietary')
depends=('ffmpeg-compat')
makedepends=('pacman>=4.2.0')
provides=("clickshare=$pkgver")
source=("https://cloud.digi-merc.org/index.php/s/HHz7qeT6LW1vp1L/download")
sha256sums=('3dfffc2edf25c705824ecedc7ad172c6dad190a298d66517a15eaad7563d27e4')

package() {
	tar -xf download -C "$pkgdir/"
}
# vim:set ts=2 sw=2 et:
