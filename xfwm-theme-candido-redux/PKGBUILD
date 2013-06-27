# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>

pkgname=xfwm-theme-candido-redux
pkgver=1
pkgrel=1
pkgdesc="Candido Redux theme for the Xfwm"
arch=("any")
url="http://candido.berlios.de"
license=('GPL')
depends=("xfwm4")
source=(http://candido.berlios.de/media/download_gallery/Candido-Redux.tar.bz2)
md5sums=('141b8d8740bd2b1e6a3f14fcd4b374ab')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/themes
  for theme in $(find . -mindepth 1 -maxdepth 1 -type d); do cp -a $theme "${pkgdir}"/usr/share/themes;done
}
