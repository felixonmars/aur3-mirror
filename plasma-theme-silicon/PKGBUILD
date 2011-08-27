#Contributor Tobias-Adrian Stibenz <info@lavalab.org>

pkgname=plasma-theme-silicon
pkgver=1.99
pkgrel=1
pkgdesc="Silicon plasmatheme for KDE 4.1"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Silicon?content=77969"
depends=('kdelibs' 'kdebase-workspace')
install='hint.install'
source=(http://kde-look.org/CONTENT/content-files/77969-Silicon199.tar.gz)
md5sums='4212a89575985565d6e4877637c85498'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R silicon $startdir/pkg/usr/share/apps/desktoptheme
}