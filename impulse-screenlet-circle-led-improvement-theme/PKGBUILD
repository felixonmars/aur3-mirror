#Contributor: twa022 <twa022 at gmail dot com>

pkgname=impulse-screenlet-circle-led-improvement-theme
pkgver=20101212
pkgrel=1
pkgdesc="Theme for Impulse Screenlet"
arch=('any')
url="http://gnome-look.org/content/show.php/Impulse+theme+%22circle+lcd%22+improvment?content=109265"
license=('GPL')
depends=('screenlets-impulse')
source=(http://gnome-look.org/CONTENT/content-files/109265-Circle%20LCD%20New.zip)

build() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/share/screenlets/Impulse/themes
  
  cp -r "Circle LCD New" $pkgdir/usr/share/screenlets/Impulse/themes/
  chmod 664 "$pkgdir/usr/share/screenlets/Impulse/themes/Circle LCD New/theme.conf"
}
md5sums=('9dbb3d079b7eb17fae108f8d2d967fa6')
