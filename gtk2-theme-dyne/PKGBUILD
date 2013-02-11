# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gtk2-theme-dyne
pkgver=0.2
pkgrel=2
pkgdesc="A simple, grey GTK2 theme"
arch=('any')
url="http://www.opendesktop.org/content/show.php?content=61936"
license=('GPL')
groups=('gtk2-themes')
depends=('gtk2')
source=(http://www.opendesktop.org/CONTENT/content-files/61936-Dyne.tar.gz)
md5sums=('15c07156e03b49409433ede2d53b6c69')

package() {
  cd "$srcdir"/Dyne

  tar -xf Dyne-gtk.tar.gz
  install -d "$pkgdir"/usr/share/themes/
  cp -r "$srcdir"/Dyne/Dyne "$pkgdir"/usr/share/themes/
}
