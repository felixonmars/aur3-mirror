# Maintainer: anex <assassin.anex[@]gmail.com>

pkgname=kde-root-action-servicemenus-frameworks
pkgver=20141218
pkgrel=3
pkgdesc="Allows admin users to perform several root only actions from dolphin via kdesu/kdesudo"
arch=('any')
url="https://github.com/anexation/kde-root-action-servicemenus-frameworks"
license=('GPL')
makedepends=('git')
depends=('dolphin-frameworks-git' 'kdialog-frameworks-git' 'ark-frameworks-git')
optdepends=("krusader-git")
source=("git+https://github.com/anexation/kde-root-action-servicemenus-frameworks.git")
md5sums=('SKIP')

package() {
cd $srcdir/kde-root-action-servicemenus-frameworks
mkdir -p $pkgdir/usr/share/apps/krusader/
install -Dm755 root-servicemenu.xml $pkgdir/usr/share/apps/krusader/root-servicemenu.xml
install -Dm755 10-rootactionsfolders.desktop $pkgdir/usr/share/kservices5/ServiceMenus/10-rootactionsfolders.desktop
install -Dm755 11-rootactionsfiles.desktop $pkgdir/usr/share/kservices5/ServiceMenus/11-rootactionsfiles.desktop
install -Dm777 rootactions-servicemenu.pl $pkgdir/usr/bin/rootactions-servicemenu.pl
}
