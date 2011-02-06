# Maintainer: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Abakus <java5@arcor.de>
pkgname=lineak-xosdplugin
pkgver=0.9
pkgrel=3
pkgdesc="XOSD plugin for LinEAK"
arch=('i686' 'x86_64')
url="http://lineak.sourceforge.net/"
license=('GPL')
depends=('lineakd>=0.9' 'xosd')
options=('!libtool')
source=(http://prdownloads.sourceforge.net/sourceforge/lineak/$pkgname-$pkgver.tar.gz
	lineak-xosdplugin.diff)
md5sums=('295bba616b3b74264385b14b242947a4'
         '04429627e07dfd03fbebfa7136dd51f9')

build() {
    cd $startdir/src/$pkgname-$pkgver
    patch -p1 -i $startdir/lineak-xosdplugin.diff || return 1
    ./configure --prefix=/usr --with-lineak-plugindir=/usr/lib/lineakd/plugins
    make || return 1
    make DESTDIR=$startdir/pkg install
}
