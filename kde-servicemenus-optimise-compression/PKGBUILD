# Maintainer: Gilrain <pierre.buard+aur gmail com>
pkgname=kde-servicemenus-optimise-compression
pkgver=1.6
pkgrel=1
pkgdesc="A service menu for the lossless optimisations of compressed files."
arch=('any')
url="http://www.kde-apps.org/content/show.php?content=17552"
license=('GPL')
depends=('optipng' 'advancecomp')
replaces=('optimise_compression')
conflicts=('optimise_compression')
source=("http://www.kde-apps.org/CONTENT/content-files/17552-optimise_compression_${pkgver}.tar.gz"
	"semicolons.patch")
sha256sums=('86f7165cf08a1dcd9c0ffa40e5878eb2e09202671459e07047d7ae069e9eaa31'
	    '0aa09b826f08eda65a721597e28e07f6d9c53004341ee3564d3e190bd572ea2c')

prepare() {
  cd Optimise\ Compression\ ${pkgver}/
  patch -p1 -i "${srcdir}/semicolons.patch"
}

package() {
  install -d ${pkgdir}/usr/share/kde4/services/ServiceMenus
  install -Dm644 Optimise\ Compression\ ${pkgver}/optimise_{gzip,mng,png,zip}.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus

  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm644 Optimise\ Compression\ ${pkgver}/{CHANGELOG,README} ${pkgdir}/usr/share/doc/${pkgname}
}
