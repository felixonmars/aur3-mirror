# Maintainer: Will R (will digi-merc.org)
# Contributors: 

pkgname=barco-clickshare
pkgver=01.07.01.79
pkgrel=1
pkgdesc="Barco ClickShare wireless presentation system software"
arch=('x86_64')
url="http://www.barco.com/en/mybarco/mysupport/productsupport/software/software-detail?nr=R33050056&rev=001007001079"
license=('proprietary')
depends=('ffmpeg-compat')
makedepends=('pacman>=4.2.0')
provides=("clickshare=$pkgver")
source=("https://cloud.digi-merc.org/index.php/s/HHz7qeT6LW1vp1L/download")
sha256sums=('9b402747f5293d9c3e02848be85f2645ed335ada8e008211f290607826ebba6a')

package() {
	tar -xf download -C "$pkgdir/"
}
# vim:set ts=2 sw=2 et:
