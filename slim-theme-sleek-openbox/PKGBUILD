# Maintainer: KillaB <xgenoblast@gmail.com>

pkgname=slim-theme-sleek-openbox
pkgver=1.0
pkgrel=1
pkgdesc='A minimalistic openbox SLiM theme'
license=('GPL')
arch=('any')
url='http://box-look.org/content/show.php/Sleek-Openbox+SLiM+Theme?content=99084'
depends=('slim')
install="${pkgname/slim-theme-/}.install"
source=("http://box-look.org/CONTENT/content-files/99084-sleek-openbox.tar.gz")
md5sums=('643ec321c0d9a35ecbc0593bf06151a8')

package() {
  cd "${srcdir}/${pkgname/slim-theme-/}"

  install -d "${pkgdir}/usr/share/slim/themes/${pkgname/slim-theme-/}"
  install -m 644 background.jpg panel.png slim.theme "${pkgdir}/usr/share/slim/themes/${pkgname/slim-theme-/}"
}
