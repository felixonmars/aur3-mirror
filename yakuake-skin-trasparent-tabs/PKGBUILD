# Contributer: giacomogiorgianni@gmail.com

pkgname=yakuake-skin-trasparent-tabs
_name=transparent-tabs
pkgver=1.0.0
pkgrel=1
pkgdesc="Yakuake skin. The point is that tabs bar is fully transparent."
arch=('any')
url="http://kde-look.org/content/show.php/Transparent+Tabs?content=151686"
license=('GPL')
depends=('yakuake')
source=(http://kde-look.org/CONTENT/content-files/151686-$_name.tar.gz)

build() {

  mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
  cp -r ${srcdir}/${_name} ${pkgdir}/usr/share/apps/yakuake/skins/

}
md5sums=('caefe3cebb851d96b34cd645c3ac2f80')
