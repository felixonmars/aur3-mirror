# Contributor: johonunu
pkgname=filezilla-oxygen
pkgver=1.0
pkgrel=1
url="http://kde-look.org/content/show.php/Oxygen+theme+for+Filezilla+++?content=141546"
pkgdesc="Oxygen icon theme for Filezilla."
arch=('any')
license=('GPL')
depends=(filezilla)
source=(http://kde-look.org/CONTENT/content-files/141546-filezilla-oxygen-theme.tar.gz)
sha1sums=('079f001cd4b7875ca430931878d55f33ea604b83')

package() {
  cd "${srcdir}"
  rm -fr oxygen-build
  cp -R oxygen oxygen-build
  install -d "${pkgdir}"/usr/share/filezilla/resources/oxygen/
  # Installing icons
  cp -R "${srcdir}"/oxygen-build/* "${pkgdir}"/usr/share/filezilla/resources/oxygen
  rm "${pkgdir}"/usr/share/filezilla/resources/oxygen/16x16/.directory
}
