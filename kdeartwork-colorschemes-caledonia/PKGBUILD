# Maintainer: danyf90 <daniele.formichelli@gmail.com

pkgname=kdeartwork-colorschemes-caledonia
_themename=Caledonia
pkgver=1.3
pkgrel=1
pkgdesc="Caledonia color scheme"
arch=('any')
url=("http://caledonia.sourceforge.net/")
license=('CC-BY; CC-BY-SA')
depends=('kdebase-workspace')
conflicts=('caledonia-bundle')
source=("http://downloads.sourceforge.net/project/caledonia/Caledonia%20Color%20Scheme/Caledonia.colors")
sha512sums=('ed1626dc34eadaa345cce4c9ba38dd4c518a47fb2ac0a19a30ef84dece6ecc51463026c252050f9e5da7d314162cdd2814af14f38b7342e85d8b2fc9acaf3daa')

package() {
  install -Dm755 $_themename.colors $pkgdir/usr/share/apps/color-schemes/$_themename.colors
}
