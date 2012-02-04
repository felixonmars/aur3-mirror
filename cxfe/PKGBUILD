# Contributor: maravic <mrvc@gazeta.pl>

pkgname=cxfe
pkgver=0.9.2
pkgrel=1
arch=('i686' 'x86_64')
license=(GPL)
pkgdesc="CXFE - Console Xine Front End"
url="http://people.iola.dk/anders/cxfe"
depends=('xine-lib')
source=(http://people.iola.dk/anders/cxfe/${pkgname}-${pkgver}.tar.bz2)
md5sums=(4f8966c09f49a29d09057cf29b883ad6)

build()        {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        #make DESTDIR=$startdir/pkg install
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/share/cxfe	
	install cxfe $startdir/pkg/usr/bin
	cp lircrc-example $startdir/pkg/usr/share/cxfe/lircrc
}
