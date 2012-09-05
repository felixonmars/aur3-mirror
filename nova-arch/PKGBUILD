# Maintainer: ilusi0n

pkgname=nova-arch
pkgver=20080313
pkgrel=1
pkgdesc="Nova Arch Openbox Theme & gtk2 theme"
arch=('any')
url="http://box-look.org/content/show.php/Nova-Arch?content=75229"
license=('GPL')
depends=('openbox')
source=(http://box-look.org/CONTENT/content-files/75229-Nova-Arch.tar.gz)
md5sums=('dad8daee0387a90570fbcecd23065fee')

package() {
    mkdir -p ${pkgdir}/usr/share/themes/
    cp -r ${srcdir}/Nova-Arch ${pkgdir}/usr/share/themes
}