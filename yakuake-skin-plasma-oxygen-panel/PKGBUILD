# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=yakuake-skin-plasma-oxygen-panel
pkgver=1.4
pkgrel=1
pkgdesc="An oxygen-style theme for Yakuake 2.9."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/[Yakuake+Skin]+Plasma:+Oxygen+-+Panel?content=92457"
license=('LGPL')
depends=('yakuake')
source=(http://kde-look.org/CONTENT/content-files/92457-plasma-oxygen-panel.tar.bz2)

build() {

  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/plasma-oxygen-panel ${pkgdir}/usr/share/apps/yakuake/skins/

}
md5sums=('6de6657d1476642e3cd3f235287ef90e')
