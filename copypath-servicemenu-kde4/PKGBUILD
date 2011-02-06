# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=copypath-servicemenu-kde4
pkgver=0.3
pkgrel=1
pkgdesc="A service menu to put the path of a file or directory into the Klipper queue"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Copy+file+or+directory+path?content=112873"
license=('GPL')
depends=('kdebase-dolphin')
source=(http://kde-apps.org/CONTENT/content-files/112873-CopyPath.desktop)
md5sums=('c87a034e2208c72afabf93d0102f978b')

build() {
cd $srcdir
mkdir -p $pkgdir/usr/share/kde4/services/ServiceMenus/
install -m755 *CopyPath.desktop $startdir/pkg/usr/share/kde4/services/ServiceMenus/CopyPath.desktop
} 
