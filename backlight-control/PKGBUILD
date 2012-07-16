# Maintainer: sapristi <mathiasmillet@gmail.com>
pkgname=backlight-control
pkgver=0.1
pkgrel=1
pkgdesc="Simple xbacklight replacement program; works in tty as well."
arch=(i686 x86_64)
url=("https://aur.archlinux.org/packages.php?ID=60908")
license=('GPL')
groups=(system)
depends=(libconfig)
install=backlight-control.install
source=("https://github.com/sapristi/misc/raw/master/backlight_control/arch_package/$pkgname.tar")
md5sums=('e3826f5bfa41febd73fbed6a0288d39e')

#generate with 'makepkg -g'



build() {
  cd $srcdir
  make backlight-control
}

package() {
  cd $srcdir
  make backlight-control
  
  install -D backlight-control $pkgdir/usr/bin/backlight-control
  install -D backlight-control.cfg $pkgdir/usr/share/backlight-control.cfg

  chmod +s $pkgdir/usr/bin/backlight-control
}
