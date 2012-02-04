# Contributor: apollokk <karanti@ontelecoms.gr>

pkgname=transparent-grey-plasmatheme
pkgver=2
pkgrel=1
pkgdesc="A new, transparent and grey, plasma theme"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kde-look.org/content/show.php/Transparent-grey?content=101261"
depends=('kdelibs' 'kdebase-workspace')
source=(http://www.kde-look.org/CONTENT/content-files/101261-Transparent-grey-2.0.tar.bz2)
md5sums=('f8c1bda4d5823f1014817398b8683949')

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Transparent-grey $startdir/pkg/usr/share/apps/desktoptheme
}