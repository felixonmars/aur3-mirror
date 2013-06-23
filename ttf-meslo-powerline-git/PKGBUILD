# Maintainer: Pablo Olmos de Aguilera C. <pablo at glatelier dot org>
# Contributor: David Goodlad <david at goodlad dot ca>
# Contributor: William Sheldon <tang0th at gmx dot com>

pkgname=ttf-meslo-powerline-git
_pkgname=Meslo
_gitname=powerline-fonts
pkgver=20130623
pkgrel=1
pkgdesc="Meslo LG is a customized version of Apple's Menlo font (includes DZ version) for usage with the Powerline plugin"
arch=('any')
url="https://github.com/Lokaltog/powerline-fonts/tree/master/Meslo"
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=('git://github.com/Lokaltog/powerline-fonts.git')
sha256sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
  cd ${_gitname}/${_pkgname}
  install -d $pkgdir/usr/share/fonts/TTF/${pkgname}
  install -d $pkgdir/usr/share/licenses/${pkgname}
  install -m644 *.otf ${pkgdir}/usr/share/fonts/TTF/${pkgname}
  install -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
