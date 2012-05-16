# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: hugo <hugoalveslobo@sapo.pt>

pkgname=xcursor-blueglass
pkgver=0.4
pkgrel=2
pkgdesc="Blue Glass cursor theme"
arch=('any')
url="http://kde-look.org/content/show.php?content=5532"
license=('LGPL')
source=("http://kde-look.org/CONTENT/content-files/5532-BlueGlass-XCursors-3D-${pkgver}.tar.bz2")
md5sums=('c43e842adbf9b17026e4fd64fc93cd28')

package() {
  cd "${srcdir}/BlueGlass-XCursors-3D-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/icons/blueglass"
  cp -r Blue/cursors "${pkgdir}/usr/share/icons/blueglass"
}
