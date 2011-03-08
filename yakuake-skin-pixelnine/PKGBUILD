# Contributor: Kirill Silin <kirill@silin.in>
pkgname=yakuake-skin-pixelnine
pkgver=0.3.0
pkgrel=1
pkgdesc="Yakuake skin based on Pixelate. Colors are neutral and dark."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Pixelnine?content=139649"
license=('MIT License')
depends=('yakuake')
source=(http://kde-look.org/CONTENT/content-files/139649-pixelnine.tar.gz)

build() {

  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/pixelnine ${pkgdir}/usr/share/apps/yakuake/skins/

}
md5sums=('25ee3259da9af6008271db2f7c37fc3b')
