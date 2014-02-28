# Contributor: Chris Darnell <cedeel@gmail.com>

pkgname=lers-xfwm-theme
pkgver=1.0
pkgrel=1
pkgdesc="Lers for XFCE"
arch=('any')
license=('custom')
url=('http://www.deviantart.com/art/Lers-for-XFCE-426983592')
source=('http://fc06.deviantart.net/fs71/f/2014/014/c/4/lers_xfce4_by_p0ngbr-d727qnc.zip')
md5sums=('bb0bb32d02b0b5e01b40d002c333a92f')

package() {
  install -d -m755 ${pkgdir}/usr/share/themes/

  cp -rf ${srcdir}/Lers ${pkgdir}/usr/share/themes
}
