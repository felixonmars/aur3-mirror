#Maintainer: Tyler Adam  < adam.tyler.j at gmail dot com >

pkgname=xcursor-ater-purple
pkgver=1.0
pkgrel=2
pkgdesc="Ater Purple cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/ATER+Purple+Mouse+Theme?content=108448"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/108448-ATER-purple.tar.gz")
md5sums=('3edfbacf4bd3b35305f5144e5844e691')

package() {
  install -d ${pkgdir}/usr/share/icons/aterpurple
  cp -r ${srcdir}/ATER-purple/* ${pkgdir}/usr/share/icons/aterpurple
}
