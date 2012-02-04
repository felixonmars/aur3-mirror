#Contributor: Flamelab <panosfilip@gmail.com>

pkgname=kde4-icon-converter
pkgver=0.6
pkgrel=1
pkgdesc="Utility for converting KDE3 icon themes to KDE4 icon themes compatible with your system."
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php/Kde4+icon+theme+converter?content=86949"
source=(http://kde-look.org/CONTENT/content-files/86949-make-kde4-icons.sh)
md5sums=('99efdfe95151eea42d8b00eb99c747c5')

build() 
{
  cd ${srcdir}/
  mkdir -p  ${pkgdir}/usr/bin
  install -m755 86949-make-kde4-icons.sh ${pkgdir}/usr/bin/make-kde4-icons
}
