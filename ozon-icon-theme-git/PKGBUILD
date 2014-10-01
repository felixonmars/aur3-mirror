# Maintainer: Localizator <localizator at ukr dot net>

pkgname=ozon-icon-theme-git
pkgver=0.r1.d18726fc3f
pkgrel=1
pkgdesc='Ozon icon theme from the Ozon OS'
arch=('any')
url='https://github.com/ozonos'
license=('GPL3')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
install="${pkgname}.install"
source=("${pkgname%-*}::git+https://github.com/ozonos/ozon-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-*}

  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership Ozon "$pkgdir"/usr/share/icons/
}

# vim: ts=2 sw=2 et:
