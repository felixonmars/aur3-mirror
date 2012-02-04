# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=kdesktop_menu
pkgver=0.3
pkgrel=3
pkgdesc="KDesktop Menu is a replacement menu for use with kicker (KDE). Inspired by Gnome menu." 
url="http://kde-apps.org/content/show.php?content=22605" 
depends=('kdelibs') 
source=(http://kde-apps.org/CONTENT/content-files/22605-$pkgname-$pkgver.tar.bz2) 
md5sums=('c9095d41467d9256c334d552bb936e1e') 
arch=(i686)
license="GPL" 

build() { 
     cd $startdir/src/$pkgname-$pkgver 
     ./configure --prefix=/opt/kde 
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
