# # Contributor: Mariano Copetti <marianocopetti@gmail.com>

pkgname=konqchecksum
pkgver=0.1
pkgrel=1
pkgdesc="Service menus for Konqueror that allow you to check the md5 or sha1 checksum of a file"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KonqCheckSum?content=83460"
license=('GPL')
depends=('kdebase')
makedepends=()
source=("http://www.kde-apps.org/CONTENT/content-files/83460-KonqCheckSum.tar.gz")
md5sums=('e1cf035a693f58b173c7a5558ec26c29')

build() {
cd $startdir/src/KonqCheckSum
# install
install -d $startdir/pkg/opt/kde/bin
install -d $startdir/pkg/opt/kde/share/apps/konqueror/servicemenus
install -d $startdir/pkg/opt/kde/share/icons
install -D -m755 *.sh $startdir/pkg/opt/kde/bin/
install -D -m644 *.desktop $startdir/pkg/opt/kde/share/apps/konqueror/servicemenus/
install -D -m644 *.png $startdir/pkg/opt/kde/share/icons/

} 