# Maintainer: kalgasnik <pan.pav.7c5@gmail.com>

pkgname=lightdm-another-gtk-greeter-themes
pkgver=1.0.6.3
pkgrel=1
pkgdesc="Themes for lightdm-another-gtk-greeter"
arch=('i686'
      'x86_64')
url="https://github.com/kalgasnik/lightdm-another-gtk-greeter-themes"
license=('GPL3')
depends=('lightdm-another-gtk-greeter')
install=lightdm-another-gtk-greeter-themes.install
source=(https://github.com/kalgasnik/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('d415d5d42933f3838c8369fe10900c3a')

package() {
  dest="/usr/share/lightdm-another-gtk-greeter"
  install -d "${pkgdir}${dest}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/data/themes" "${pkgdir}${dest}/"
}
