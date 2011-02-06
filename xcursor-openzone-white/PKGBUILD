# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>
pkgname=xcursor-openzone-white
pkgver=1.0.2
pkgrel=1
pkgdesc="Openzone-White X11 cursor theme"
url="http://opendesktop.org/content/show.php/OpenZone-White?content=111458"
arch=('any')
license=('custom:xcursor-openzone-white')
source=('http://opendesktop.org/CONTENT/content-files/111458-OpenZone-White-1.0.2.tar.bz2')
md5sums=('da4582cbf58594213db4be9c2d162a13')

build() {
  mkdir -p ${pkgdir}/usr/share/icons/OpenZone-White
  cp -R ${srcdir}/OpenZone-White/{cursors,index.theme} ${pkgdir}/usr/share/icons/OpenZone-White
  install -D -m644 ${srcdir}/OpenZone-White/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
