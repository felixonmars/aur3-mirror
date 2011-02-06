# Contributor: Leandro Costa <lokidarkeden@gmail.com>
pkgname=msn-proxy
pkgver=0.7
pkgrel=1
pkgdesc="A lightweight transparent proxy for the msn messenger clients and allow you to control and monitor the use of messenger on your network."
arch=('i686')
url="http://sourceforge.net/projects/msn-proxy/"
license=('BSD')
depends=(libevent mysql)
source=(http://downloads.sourceforge.net/msn-proxy/$pkgname-$pkgver.tar.gz msn-proxy.sh Makefile.patch)
md5sums=('11faa72c70c36874685ca1b0ed382dcc'
          'bb142ff7bccbd43ddc1ee9fa8cc1ea61'
          'd9fc657614b05c003a43a20ee293ac04' 
)

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -i ../Makefile.patch || return 1
	make || return 1
	make install DESTDIR=$startdir/pkg || return 1
	install -D -m755 ../msn-proxy.sh ${startdir}/pkg/etc/rc.d/msn-proxy
	chmod 600 ${startdir}/pkg/etc/msn-proxy/mysql/conf
}

