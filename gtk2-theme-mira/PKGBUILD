# Contributor: William Díaz <wdiaz@archlinux.us>

pkgname=gtk2-theme-mira
pkgver=0.5
pkgrel=2
realname=Mira
pkgdesc="A Dark GTK Theme"
arch=('i686' 'x86_64')
url="http://sen7.deviantart.com/art/Mira-100077120"
license=('GPL')
groups=('gtk2-themes')
depends=()
source=(http://fc04.deviantart.com/fs40/f/2009/037/f/9/${realname}_by_sen7.tar)
md5sums=('acd5b08a7204a979e61452a272dcc3f2')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/themes/Mira
  tar xf ${realname}_by_sen7.tar
  mv ${srcdir}/Mira ${pkgdir}/usr/share/themes; mv ${srcdir}/Mirav2 $pkgdir/usr/share/themes
}
