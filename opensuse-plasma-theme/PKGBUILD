# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=opensuse-plasma-theme
pkgver=13.2
pkgrel=1
pkgdesc="Latest openSUSE Factory version of KDE Plasma theme."
arch=('any')
url="http://www.opensuse.org/"
license=('custom')
depends=('kdebase-workspace')
groups=('kde')
source=("https://github.com/openSUSE/kdebase-opensuse/archive/master.zip")
sha256sums=('eadc1bdcf2c8a9eb0f475a6b411c68ae3271e6454b5e618575819e736c11b51e')

package() {
  cd "$srcdir"/kdebase-opensuse-master/config-files/usr/share/
  
  mkdir -p "$pkgdir"/usr/share/{apps/desktoptheme,licenses/$pkgname}
  cp -R kde4/apps/desktoptheme/openSUSE{,default} "$pkgdir"/usr/share/apps/desktoptheme/
  install -Dm644 ../../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}