# Maintainer: Nick Erdmann <erdmann@date.upb.de>
pkgname=slim-theme-black
pkgver=0
pkgrel=2
pkgdesc="a minimalist SLiM theme."
arch=('i686' 'x86_64')
url="http://img51.imageshack.us/img51/1383/screenshotcjz.png"
depends=('slim')
license=('none')
source=('background.png' 'panel.png' 'slim.theme')
md5sums=('7d35eef4f07ad846e42e1d2ff138c791' '33973af372fcd8d2775563c28f3f12ef' '13c11b9530160f5895e5eb68b9cc2e39')

package() {
  mkdir -p ${pkgdir}/usr/share/slim/themes/black/
  cp background.png ${pkgdir}/usr/share/slim/themes/black/
  cp panel.png ${pkgdir}/usr/share/slim/themes/black/
  cp slim.theme ${pkgdir}/usr/share/slim/themes/black/
}
