# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=openbox-dyne-theme
pkgver=20090406
pkgrel=2
pkgdesc="Dyne OpenBox Theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=62000"
license=('GPL')
source=(http://opendesktop.org/CONTENT/content-files/62000-Dyne-openbox.tar.gz)
md5sums=('96e3672cfc9ecfb8992f40f88485b5f7')

package() {
  install -dm755 "$pkgdir"/usr/share/themes/

  cp -r "$srcdir"/Dyne "$pkgdir"/usr/share/themes/
}
