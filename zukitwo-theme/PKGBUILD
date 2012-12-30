# Maintainer: Pierre Schiltz <mysti57155@gmail.com>
pkgname=zukitwo-theme
pkgver=2012.12.16
pkgrel=1
pkgdesc="Zukitwo gtk3 and gnome-shell themes"
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo?content=140562"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
source=('http://gnome-look.org/CONTENT/content-files/140562-Zukitwo.zip')
md5sums=('dd9de5bfcee6fdde78bd71c557f03ba4')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Zukitwo ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Zukitwo-Shell ${pkgdir}/usr/share/themes/
}

