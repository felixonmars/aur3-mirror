#Contributor Fedor Suchkov <f.suchkov@gmail.com>

pkgname=plasma-theme-atelier
pkgver=1.0
pkgrel=1
pkgdesc="This is a color matching plasma theme inspired by the exceptional and beautiful Skulpture KDE style."
arch=('i686' 'x86_64')
license=('CCPL')
url="http://www.kde-look.org/content/show.php?content=99440"
depends=('kdelibs' 'kdebase-workspace')
source=(http://www.kde-look.org/CONTENT/content-files/99440-Atelier.tar.gz)
md5sums='768aab5c7365a3d49797b15d9b59bded'

build()
{
  mkdir -p $startdir/pkg/usr/share/apps/desktoptheme
  cd $startdir/src
  cp -R Atelier $startdir/pkg/usr/share/apps/desktoptheme
}
