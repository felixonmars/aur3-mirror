# Maintainer: 
#
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: JD Horelick <jdhore1@gmail.com>
#
pkgname=dsyslog
pkgver=0.4.0
pkgrel=1
pkgdesc="advanced, modular syslog daemon"
arch=('i686' 'x86_64')
url="http://nenolod.net/dsyslog"
license=('GPL')
depends=('glib2' 'libmysqlclient')
install=${pkgname}.install
source=("http://distfiles.atheme.org/${pkgname}_${pkgver}.tar.gz")
md5sums=('f0d477a1460864a7fb2ccb662a313de6')

prepare () {
    cd "$srcdir/$pkgname-$pkgver"

    ./autogen.sh
    
    ./configure --prefix=/usr \
		--localstatedir=/var \
		--sysconfdir=/etc

}

build () {
    
    cd "$srcdir/$pkgname-$pkgver"

    make || make 
  
}

package () {

    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR=$pkgdir install
}
