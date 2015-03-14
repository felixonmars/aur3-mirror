# Contributer: giacomogiorgianni@gmail.com 

pkgname=dockmanager-kde_and_extra
_name=dockmanager
pkgver=0.9.17
pkgrel=1
pkgdesc="Dockmanager scripts for: dolphin,konsole,firefox,kopete,akonadi,krdc,kate,clementine,amarok,rekonq,konqueror,chromium,chrome and last.fm"
arch=('any')
url="http://kde-look.org/content/show.php/dockmanager-kde_and_extra?content=151511"
license=('GPL')
categories=()
depends=('kdebase-runtime>=4.8' 'python2-mpd')
makedepends=()
options=(!emptydirs)
source=("http://kde-look.org/CONTENT/content-files/151511-$pkgname-$pkgver.tgz")
md5sums=('5fbf99ae42a8ed43acf0dae175f39164')

package() {

cd $srcdir
install -dm 755 $pkgdir/usr/share/dockmanager
cp -ax metadata $pkgdir/usr/share/dockmanager
cp -ax scripts $pkgdir/usr/share/dockmanager
}
