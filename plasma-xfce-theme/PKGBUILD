# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=plasma-xfce-theme
pkgver=0.98.1
pkgrel=1
pkgdesc="An 'old school' black theme"
arch=('any')
url="http://xfce-look.org/content/show.php/Plasma+Shock+%2B+Bolt+%2B+Fire?content=151465"
license=('GPL')
depends=('gtk-xfce-engine' 'gtk-engines')
source=("http://xfce-look.org/CONTENT/content-files/151465-plasmabugfix.tar.gz")
md5sums=('34269a88b4160955e1e8709d3256f7d0')

package() {
#  cd ${srcdir}/DarkCold-OriginalSeed-xfwm
  install -d "${pkgdir}/usr/share/themes"
  cp -R 'Plasma Bolt' ${pkgdir}/usr/share/themes
  cp -R 'Plasma Fire' ${pkgdir}/usr/share/themes
  cp -R 'Plasma Shock' ${pkgdir}/usr/share/themes
}
