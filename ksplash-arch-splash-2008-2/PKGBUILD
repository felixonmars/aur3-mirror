# Maintainier Lava186<info@lavalab.org> 
# Contributor R Vega

pkgname=ksplash-arch-splash-2008-2
pkgver=1.0
pkgrel=1
pkgdesc="A Simple KSplash with the new Archlogo"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Arch+Splash+2008?content=73642"
depends=('kdebase')
source=(http://www.lavalab.org/arch/stuff/Arch-splash-2008-2.tar.gz)
md5sums=('5b875e5d5749e40f12b3d66558b920c3')

build()
{
 cd $startdir/src
 mkdir -p $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
 cp -R Arch-splash-2008-2 $startdir/pkg/opt/kde/share/apps/ksplash/Themes
}