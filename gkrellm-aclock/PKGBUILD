# Contributor: Chris Mortimore <chris.mortimore@googlemail.com>
# Maintainer: my64 <package@obordes.com>
pkgname=gkrellm-aclock
pkgver=0.3.4
pkgrel=2
pkgdesc="Analog clock"
arch=('i686' 'x86_64')
license=('GPL')

url="http://www.eocities.com/m_muthukmar/gkrellalock.html"
depends=('gkrellm')
source=(http://www.geocities.com/m_muthukumar/gkrellaclock-0.3.4.tar.gz)
md5sums=('37957ad3db335af4ed62dcab00856b09')
build() {
	cd $startdir/src/gkrellAclock-0.3.4/
	rm *.o
	make
	mkdir -p $startdir/pkg/usr/lib/gkrellm2/plugins/
	install -m 755 gkrellaclock.so $startdir/pkg/usr/lib/gkrellm2/plugins/
}
