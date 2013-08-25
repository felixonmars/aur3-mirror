# Contributor: Nathan O <ndowens.aur at gmail dot com> 

pkgname=bes
pkgver=3.11.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="High-performance back-end server software framework that allows data providers more flexibility in providing end users views of their data"
url="http://www.opendap.org/download/BES.html"
license="LGPL"
depends=('libxml2' 'openssl' 'bash' 'bzip2')
options=('!libtool' '!emptydirs')
backup=('etc/bes/bes.conf')
install=${pkgname}.install
source=("http://www.opendap.org/pub/source/$pkgname-$pkgver.tar.gz")
md5sums=('961910716750668c1f68a3bd7d4b7532')


build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {

	cd $srcdir/$pkgname-$pkgver

	#install -d $pkgdir/etc/rc.d
	make DESTDIR=$pkgdir install
	#sed -i 's|. /etc/rc.d/init.d/functions|. /etc/rc.d/functions|g' $pkgdir/usr/bin/besd
	#mv $pkgdir/usr/bin/besd $pkgdir/etc/rc.d/besd
}

