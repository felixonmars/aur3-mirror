#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-ater-blue
pkgver=1.0
pkgrel=2
pkgdesc="Ater Blue cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/ATER+Blue+Mouse+Theme?content=93647"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/93647-ATER_Blue.tar.gz")
md5sums=('8a2da5ac436c54a7dfcff200ce414bd8')

package() {
    install -d ${pkgdir}/usr/share/icons/aterblue
    cp -r ${srcdir}/ATER_Blue/* ${pkgdir}/usr/share/icons/aterblue
}