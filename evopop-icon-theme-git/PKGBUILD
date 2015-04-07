# Maintainer: Ivan Petruk <localizator at ukr dot net>

_realname=EvoPop
pkgname=evopop-icon-theme-git
pkgver=0.r242.b6c1481
pkgrel=1
pkgdesc='A simple icon theme with some google material design inspiration. (git version)'
arch=('any')
url='https://github.com/solus-project/evopop-icon-theme'
license=('GPL3')
provides=("${pkgname%-*}")
conflicts=("evopop-icon-theme")
options=('!strip')
install="${pkgname}.install"
source=("${pkgname%-*}::git+https://github.com/solus-project/evopop-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-*}

  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership $_realname "$pkgdir"/usr/share/icons/
}

# vim: ts=2 sw=2 et:
