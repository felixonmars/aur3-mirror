# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=mailkount
pkgver=0.3.1
pkgrel=1
pkgdesc="Applet for Kicker that checks the number of mails on pop/imap servers" 
url="http://goondy.free.fr/gentoo/mailkount/" 
depends=('kdelibs')
source=(http://goondy.free.fr/gentoo/mailkount/$pkgname-$pkgver.tar.bz2) 
md5sums=('e0ed861b30eade1f2c4a61eee3451916') 
arch=('i686')
license="GPL" 

build() { 
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/opt/kde
    make || return 1
    make DESTDIR=$startdir/pkg install	      
}  
