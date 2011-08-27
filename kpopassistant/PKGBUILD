# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=kpopassistant
pkgver=0.3
pkgrel=1
pkgdesc="Multi-pop POP3 mail checker with extended features for KDE similar to KShowMail." 
arch=('i686')
url="http://kde-apps.org/content/show.php/KPopAssistant?content=54550" 
license=('GPL') 
depends=('pyqt' 'pykde' 'python-pysqlite')
source=(http://kde-apps.org/CONTENT/content-files/54550-$pkgname-$pkgver.tar.bz2 \
	kpopassistant) 
md5sums=('f578f250a6e103795329697823058a94' \
	 'd6a0ac70900dad1b2e6ed1deea1adaa9' ) 
	 
build() { 
    cd $startdir/src/$pkgname-$pkgver
    install -d $startdir/pkg/usr/bin/
    install -m 755 ../kpopassistant $startdir/pkg/usr/bin/
    install -d $startdir/pkg/usr/lib/$pkgname/icons
    install -m 644 ./$pkgname/icons/*.png $startdir/pkg/usr/lib/$pkgname/icons
    install -d $startdir/pkg/opt/kde/share/icons    
    install -m 644 ./$pkgname.png $startdir/pkg/opt/kde/share/icons
    install -d $startdir/pkg/opt/kde/share/applnk/Internet
    install -m 644 ./$pkgname.desktop $startdir/pkg/opt/kde/share/applnk/Internet
    install -d $startdir/pkg/usr/lib/kpopassistant
    install -m 644 ./$pkgname/ui_* $startdir/pkg/usr/lib/kpopassistant
    install -m 755 ./$pkgname/$pkgname.py $startdir/pkg/usr/lib/kpopassistant
}  
