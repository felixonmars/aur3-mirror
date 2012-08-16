# Maintainer: Joel Pedraza <pkgs@saik0.net>

pkgname=refind-theme-gris
pkgver=0.1
pkgrel=1
pkgdesc='A simple monochromatic gray theme for rEFInd'
arch=('any')
url="http://opendesktop.org/content/show.php?content=153267"
license=('CC0')
depends=('refind-efi-x86_64')
source=("refind_gris-0.1.tar.gz::http://opendesktop.org/CONTENT/content-files/153267-refind_gris-${pkgver}.tar.gz")
sha256sums=('8235730f471b1879961002a04c27deaba73cc189fd852bb5b99bd9968953042a')

package() {
  install -dm755  "${pkgdir}/boot/efi/EFI/arch/refind/refind_gris" 
  cd "${srcdir}/refind_gris"
  install -Dm644 *{.bmp,.icns,.sample} "${pkgdir}/boot/efi/EFI/arch/refind/refind_gris"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
