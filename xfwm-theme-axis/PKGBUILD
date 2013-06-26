# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar at gmail dot com>

pkgname=xfwm-theme-axis
pkgver=20091022
pkgrel=3
pkgdesc="Axis: a minimal, squared Xfwm theme. Picks up your gtk colors, but works best for bright colored themes."
arch=('i686' 'x86_64')
url="http://www.xfce-look.org/content/show.php/axis+xfwm?content=95158"
license=('GPL')
depends=('xfwm4')
source=(http://xfce-look.org/CONTENT/content-files/95158-axis-xfwm.tar.gz)
md5sums=('db4246e83ccb04c93437fa27ba9c11c8')

package() {
  install -d ${pkgdir}/usr/share/themes || return 1
  cp -r ${srcdir}/axis  ${pkgdir}/usr/share/themes || return 1
}
