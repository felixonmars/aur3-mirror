# Maintainer: Vinzenz Vietzke <vinz@vinzv.de>

pkgname=gimp-theme-progimp
pkgver=1.1
pkgrel=2
pkgdesc="A small, grey Photoshop-like theme for Gimp"
arch=('any')
url="http://my.opera.com/area42/blog/2012/06/24/greyscale-icon-theme-for-gimp"
license=('Unknown')
depends=('gimp')
source=("http://dev.speed-dreams.org/Eckhard/pro-gimp-greyscale-color-icon-theme-120630.zip")
sha1sums=('f3d076f3525da0646228457fffec0f8e0a7752c1')

package() {
   cd ${srcdir}
   install -d ${pkgdir}/usr/share/gimp/2.0/themes
   cp -r ${srcdir}/ProGimp ${pkgdir}/usr/share/gimp/2.0/themes || return 1
}

