# Maintainer: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Abakus <java5@arcor.de>
pkgname=lineak-defaultplugin
pkgver=0.9
pkgrel=3
pkgdesc="Default plugin for LinEAK"
arch=('i686' 'x86_64')
url="http://lineak.sourceforge.net/"
license=('GPL')
depends=('lineakd>=0.9')
options=('!libtool')
source=(http://prdownloads.sourceforge.net/sourceforge/lineak/$pkgname-$pkgver.tar.gz
	lineak-defaultplugin.diff)
md5sums=('425df8c225c1a079a4ed1f221d2a5479'
         'c23703d55d3543aa5b006b91c0546f45')

build() {
    cd $startdir/src/$pkgname-$pkgver
    patch -p1 -i $startdir/lineak-defaultplugin.diff || exit 1
    echo "Running autoreconf..."
    autoreconf || return 1
    ./configure --prefix=/usr --mandir=/usr/man --sysconfdir=/etc --with-lineak-plugindir=/usr/lib/lineakd/plugins
    make || return 1
    make DESTDIR=$startdir/pkg install
}
