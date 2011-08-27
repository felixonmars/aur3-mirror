# Maintainier Lava186<info@lavalab.org> 
# Contributor conholster

pkgname=kde-kickerbg-conholster-panel-backgrounds
pkgver=1.0
pkgrel=1
pkgdesc="Conholster Kicker background"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kde-look.org/content/show.php/Conholster+Panel+Backgrounds?content=74370"
depends=('kdebase')
source=(http://www.kde-look.org/CONTENT/content-files/74370-Panels.tar.gz)
md5sums=('469684c4be2ab8ed27489f0b3b1a4636')

build()
{
 cd $startdir/src
 mkdir -p $startdir/pkg/opt/kde/share/apps/kicker/wallpapers
 mv *.png $startdir/pkg/opt/kde/share/apps/kicker/wallpapers
}