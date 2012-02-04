# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=qcat
pkgver=0.5
pkgrel=1
pkgdesc="CD/DVD/Media cataloging software in qt4" 
arch=('i686')
url="http://kde-apps.org/content/show.php/QCat?content=62522" 
license=('GPL') 
depends=('qt4' 'sqlite3')
source=(http://kde-apps.org/CONTENT/content-files/62522-$pkgname-dist-$pkgver.tar.gz qcat.desktop) 
md5sums=('87c81893fa262d218c8ca0a8e39efac1' \
	 'bb09e1073c8625cb89aa97e467eed69d') 

build() { 
     cd $startdir/src/$pkgname-dist-$pkgver
     qmake
     make || return 1 
     install -D -m 755 ./bin/qcat $startdir/pkg/usr/bin/qcat
     install -D -m 644 ../qcat.desktop $startdir/pkg/usr/share/applications/qcat.desktop
     install -D -m 644 ./icons/db_icons/catalog_enabled.png $startdir/pkg/usr/share/icons/hicolor/64x64/apps/qcat.png  
}  
