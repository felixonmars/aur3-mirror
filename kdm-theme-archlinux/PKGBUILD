# Maintainier Lava186<info@lavalab.org> 
# Contributor ironwiller

pkgname=kdm-theme-archlinux
pkgver=1.0
pkgrel=1
pkgdesc="A KDM Theme with the new Archlogo"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/KdmArchLinux?content=73603"
depends=('kdmtheme')
source=(http://www.lavalab.org/arch/stuff/KdmArcLinux.tar.gz)
md5sums=('01ff5dc9a50846d552d8169310ab3b34')

build()
{
 cd $startdir/src/KdmArcLinux
 mkdir -p $startdir/pkg/opt/kde/share/apps/kdm/themes/
 tar xzf KdmArchlinux-DeJaVuSans.tar.gz
 tar xzf KdmArchLinux.tar.gz
 cp -R KdmArchLinux $startdir/pkg/opt/kde/share/apps/kdm/themes
 cp -R KdmArchlinux-DeJaVuSans $startdir/pkg/opt/kde/share/apps/kdm/themes
}