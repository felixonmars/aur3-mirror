# Maintainer: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Abakus <java5@arcor.de>
pkgname=lineak-kdeplugins
pkgver=0.9
pkgrel=3
pkgdesc="KDE plugins for LinEAK"
arch=('i686')
url="http://lineak.sourceforge.net"
license=('GPL')
depends=('kdelibs3' 'kdemultimedia3' 'lineakd>=0.9')
options=('!libtool')
source=(http://prdownloads.sourceforge.net/sourceforge/lineak/$pkgname-$pkgver.tar.gz
	lineak-kdeplugins.diff)
md5sums=('8046d3f2a199dc5745e512a2c1cff8ae'
         '96350466439ec21380b8c1533decd96c')

build() {
    cd $startdir/src/$pkgname-$pkgver

    patch -p1 -i $startdir/lineak-kdeplugins.diff || return 1

	kdeinclude=""
	if [ -d /opt/kde/include ];then
		kdeinclude="--with-extra-includes=/opt/kde/include"
	fi

    ./configure --with-qt-dir=/opt/qt --prefix=/usr --with-lineak-plugindir=/usr/lib/lineakd/plugins $kdeinclude
    
	make || return 1
    make DESTDIR=/$startdir/pkg install
}
