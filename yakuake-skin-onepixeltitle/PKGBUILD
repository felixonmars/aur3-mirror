# Maintainer: Nick Erdmann <erdmann@date.upb.de>
pkgname=yakuake-skin-onepixeltitle
pkgver=0.1
pkgrel=1
pkgdesc="Yakuake skin without neither tabbar nor titlebar."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/One+Pixel+Title?content=142441"
license=('GPL')
depends=('yakuake')
makedepends=('unzip')
options=(!strip !zipman)
source=('http://kde-look.org/CONTENT/content-files/142441-onepixeltitle.zip')
md5sums=('7b2ec4621130e3df9786a1f2f8f8f3e6')

package() {
  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/onepixeltitle ${pkgdir}/usr/share/apps/yakuake/skins/
}
