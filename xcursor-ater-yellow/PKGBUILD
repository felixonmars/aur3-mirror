#Maintainer: Tyler Adam  < adam.tyler.j at gmail dot com >

pkgname=xcursor-ater-yellow
pkgver=0.1
pkgrel=2
pkgdesc="Ater Yellow cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/ATER+Cursor+Theme?content=47521"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/47521-ATER-mouse-theme-0.1.tar.gz")
md5sums=('182957004e5571009c82aa30588ad03b')

package() {
  install -d ${pkgdir}/usr/share/icons/ateryellow
	cp -r ${srcdir}/ATER-yellow/* ${pkgdir}/usr/share/icons/ateryellow
}
