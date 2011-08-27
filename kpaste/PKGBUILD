 
# Contributor: Mattheus Happe <mhappe@gmail.com>
 
pkgname=kpaste
pkgver=0.5
pkgrel=2
pkgdesc="http://www.rafb.net/paste nopaste servicemenu for kde"
url="http://www.kde-apps.org/content/show.php/kpaste?content=52154"
depends=('kdelibs' 'python')
source=(http://www.kde-apps.org/CONTENT/content-files/52154-$pkgname-$pkgver.tar.bz2)
md5sums=('baa38ea7806997afd7e2d835ffb65830')
arch=('i686' 'x86_64')
license="GPL"

build() {
     cd $startdir/src/$pkgname-$pkgver/src
     install -m 755 -D kpaste $startdir/pkg/opt/kde/bin/kpaste
     install -m 444 -D kpaste.desktop $startdir/pkg/opt/kde/share/apps/konqueror/servicemenus/kpaste.desktop
     install -m 444 -D kpaste.png $startdir/pkg//usr/share/pixmaps/kpaste.png
}
