# Contributor: Daniel Milde <info@milde.cz>

pkgname=mimon
pkgver=0.2.6
pkgrel=1
pkgdesc="Minimalistic load monitor"
url="https://launchpad.net/mimon"
license=(GPL)
arch=('i686' 'x86_64')
depends=('python' 'rrdtool')
source=("http://launchpad.net/mimon/trunk/0.2.6/+download/mimon-0.2.6.tar.gz"
		"mimon")
md5sums=('177b2e39cbe46558032a96b1669b2dc6'
		 '0cf2c66a6416008a029d7f54b7b16d2e')

build() {
	cd $srcdir/$pkgname-$pkgver
	
	python setup.py install --root=$startdir/pkg
	
	install -D -m755 ./mimond ${pkgdir}/usr/bin/mimond
	install -D -m755 ./mimon-graph ${pkgdir}/usr/bin/mimon-graph
	
	install -D -m644 ./mimon.conf ${pkgdir}/etc/mimon.conf
	install -D -m755 ../../mimon  ${pkgdir}/etc/rc.d/mimon
	
	install -d ${pkgdir}/var/lib/mimon
}