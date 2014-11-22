pkgname=mint-cinnamon-themes-git
pkgver=0.r62.b20eefc
pkgrel=1
pkgdesc="Collection of colourful Cinnamon themes from Linux Mint github."
arch=('any')
url='https://github.com/linuxmint/cinnamon-themes'
license=('GPL3')
depends=('cinnamon')
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
options=('!strip')
#install="${pkgname%-*}.install"
source=("git+https://github.com/linuxmint/cinnamon-themes.git")
sha256sums=('SKIP')

pkgver() {
  cd cinnamon-themes

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd cinnamon-themes

  install -dm 755 "$pkgdir"/usr/share/themes
  cp -dr --no-preserve='ownership' "$srcdir"/cinnamon-themes/usr/share/themes/* "$pkgdir"/usr/share/themes/
}
