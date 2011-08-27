# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer: Viliam Pucik <viliam.pucik@gmail.com>
pkgname=ttf-apres
pkgver=1.0
pkgrel=1
pkgdesc="Apres Fonts"
arch=('any')
url="http://code.google.com/p/sasflex/source/browse/trunk/CustomVolumeSlider/src/assets/fonts/"
license=('unknown')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=('Apres-Bold.ttf' 'ApresCondensed-Regular.ttf' 'Apres-Italic.ttf' 'Apres-Light.ttf' 'Apres-Regular.ttf')
md5sums=('60c57497daabdf803e2e89b170cb5e13'
         '7d1ab7657a9f19fc4f1bae5bb5f23234'
         'fc1d5e3ef558662327bfb8f631ced5e9'
         'e531e0373daec5022d1d8dc1a656cae0'
         'c7fa5705708e76e285ff81dd482fb622')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF/"
  cd "${srcdir}"
  for font in "${source[@]}"; do
    install -Dm644 "${font}" "${pkgdir}/usr/share/fonts/TTF/"
  done
}

# vim:set ts=2 sw=2 et:
