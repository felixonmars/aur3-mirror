pkgname=ksplash-dharma-arch
pkgver=1.0
pkgrel=1
pkgdesc="Dharma KSplash-QML for Arch Linux modified from Chakra Project."
arch=('any')
url="http://kde-look.org/content/show.php/Dharma+Arch?content=155983"
license=('cc-by-sa-3.0')
source=("http://kde-look.org/CONTENT/content-files/155983-${pkgname}.tar.gz")
md5sums=('deae2f0cbed35daa3627effd571babbd')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes
  cp -r Dharma-Arch ${pkgdir}/usr/share/apps/ksplash/Themes
}
