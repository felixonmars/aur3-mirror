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
source=("https://cloud.digi-merc.org/index.php/s/rlQOpUHP6bV3968/download")
sha256sums=('121b1d76b6ec8bb1fb01bdd5b7215ef0a148e522c35cb60c51265d21e047b4ce')

package() {
	tar -xf download -C "$pkgdir/"
}
# vim:set ts=2 sw=2 et:
