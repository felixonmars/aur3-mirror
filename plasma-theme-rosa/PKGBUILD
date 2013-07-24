# Contributor: wrajaka
# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=plasma-theme-rosa
_pkgname=plasma-desktoptheme-rosa
pkgver=1.2.5
pkgrel=1
pkgdesc="Original theme for the plasma-desktop from ROSA Laboratory. As seen on Mandriva 2011."
arch=('any')
url=http://rosalab.ru/
license=('GPL')
groups=(kde kdeartwork)
depends=(kdelibs kdebase-workspace)
source=(http://mirror.yandex.ru/rosa/rosa2012.1/repository/i586/main/release/${_pkgname}-${pkgver}-2-rosa2012.1.noarch.rpm)
sha256sums=('4d899b94048f40fbdf1eb9f9ad3e0ae8c2d4f453ff663b15a7be42afc9589ed3')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cp -R ./usr/share/apps/desktoptheme/ROSA $pkgdir/usr/share/apps/desktoptheme
}