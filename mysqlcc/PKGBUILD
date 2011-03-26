# $Id: PKGBUILD,v 1.5 2009/02/11 13:11:46 abhidg Exp $
# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>

# Maintainer: Patrick BAumgart <baumi@gmx.com>

pkgname=mysqlcc
pkgver=0.9.8
pkgrel=5
pkgdesc="MySQL Control Center is GUI front end for MySQL database creation and administration"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mysqlcc/"
license=('GPL')
depends=('libstdc++5' 'qt3' 'libmysqlclient')
source=(http://downloads.sourceforge.net/sourceforge/mysqlcc/$pkgname-$pkgver-src.tar.gz
        patch.mysqlcc)

md5sums=('c9913784e9a700c6e9a146ffea1992d0' 
         'f12f5b5e8277177bcf7ffd31c6709951')

build() {
	. /etc/profile.d/qt3.sh

    cd $startdir/src
    patch -p0 < patch.mysqlcc

	cd $startdir/src/$pkgname-$pkgver-src
  	./configure --prefix=/usr
  	make || return 1
	mkdir -p $startdir/pkg/usr/{bin,share/mysqlcc}
	install -m755 mysqlcc $startdir/pkg/usr/bin
	cp -R mysqlcc.xpm plugins translations xpm *.wav syntax.txt $startdir/pkg/usr/share/mysqlcc
}
