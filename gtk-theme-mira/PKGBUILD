# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: William Díaz <wdiaz@archlinux.us>

pkgname=gtk-theme-mira
pkgver=0.5
pkgrel=2
pkgdesc="A Dark GTK Theme"
arch=('i686' 'x86_64')
url="http://sen7.deviantart.com/art/Mira-100077120"
license=('GPL')
depends=()
source=(http://fc04.deviantart.com/fs40/f/2009/037/f/9/Mira_by_sen7.tar)
md5sums=('acd5b08a7204a979e61452a272dcc3f2')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/themes/Mira
  tar xf Mira_by_sen7.tar
  mv ${srcdir}/Mira ${pkgdir}/usr/share/themes; mv ${srcdir}/Mirav2 $pkgdir/usr/share/themes
}
