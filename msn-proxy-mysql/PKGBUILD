# Contributor: David Valentim Dias <dvdscripter@gmail.com>
pkgname=msn-proxy-mysql
pkgver=0.6.3
pkgrel=1
pkgdesc="A lightweight transparent proxy used to control/monitor the use of msn messenger clients. Using mysql."
arch=('i686')
url="http://sourceforge.net/projects/msn-proxy/"
license=('BSD')
depends=(libevent mysql)
source=(http://downloads.sourceforge.net/msn-proxy/msn-proxy-$pkgver-mysql.tar.gz
	Makefile.patch
	msn-proxy.sh)

md5sums=('1b143133d3462b3a6fdc22dc77e3df5a'
        'd9fc657614b05c003a43a20ee293ac04'
	'bb142ff7bccbd43ddc1ee9fa8cc1ea61')


build() {
	cd $startdir/src/msn-proxy
	patch -p0 -i ../Makefile.patch || return 1
	make DESTDIR=$startdir/pkg install || return 1
	install -D -m755 ../msn-proxy.sh ${startdir}/pkg/etc/rc.d/msn-proxy
	chmod 600 ${startdir}/pkg/etc/msn-proxy/mysql/conf
}
