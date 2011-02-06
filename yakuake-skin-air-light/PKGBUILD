# Contributor: dieghen89 <dieghen89 at gmail dot com>
pkgname=yakuake-skin-air-light
pkgver=4.4
pkgrel=1
pkgdesc="An air-style theme for Yakuake 2.9"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Yakuake+Air+Theme+%284.4%29?content=125329"
license=('LGPL')
depends=('yakuake')
source=(http://adrestia.creativemisconfiguration.com/files/ffejery/kde/themes/yakuake/air-${pkgver}/air-${pkgver}.tar.gz)
md5sums=('b0cad637048b113343f6a0f78e7b3ce3')

package() {
mkdir -p ${pkgdir}/usr/share/apps/yakuake/skins/
cp -r ${srcdir}/air-4.4-light ${pkgdir}/usr/share/apps/yakuake/skins/
}
