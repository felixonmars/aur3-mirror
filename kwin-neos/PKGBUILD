pkgname=kwin-neos
pkgver=0.2
pkgrel=1
pkgdesc="Window decoration for KDE" 
url="http://www.kde-look.org/content/show.php/Neos?content=12125" 
license="GPL" 
arch=(i686 x86_64)
depends=('kdebase' 'kdelibs') 
source=(http://perso.orange.fr/chamayou/kwin-neos-0.2b.tar.bz2) 
build() { 
	cd $startdir/src/kwin-neos-0.2b 
	./configure --prefix=/opt/kde
	make || return 1
	make prefix=$startdir/pkg/opt/kde install	
}
md5sums=('3b483dd2a76b44dc94c79b382dc0942a')
