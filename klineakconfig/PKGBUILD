# Maintainer: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Abakus <java5@arcor.de>
pkgname=klineakconfig
pkgver=0.9
pkgrel=3
pkgdesc="KDE GUI for configuring LinEAK"
arch=('i686')
url="http://lineak.sourceforge.net"
license=('GPL')
depends=('kdelibs3' 'lineakd>=0.9' )
source=(http://prdownloads.sourceforge.net/sourceforge/lineak/$pkgname-$pkgver.tar.gz
	klineakconfig.diff)
md5sums=('b673575854f8d31443e05614ebb3e238'
         '5502c05142c7da8d87faa1980ebbf0be')

build() {
    cd $startdir/src/$pkgname-$pkgver

    patch -p1 -i $startdir/klineakconfig.diff || exit 1
	
	kdeinclude=""
	if [ -d /opt/kde/include ];then
		kdeinclude="--with-extra-includes=/opt/kde/include"
	fi
    
	./configure --prefix=/usr --with-lineak-plugindir=/usr/lib/lineakd/plugins $kdeinclude
    
	make || exit 1
    make DESTDIR=/$startdir/pkg install || exit 1
}
