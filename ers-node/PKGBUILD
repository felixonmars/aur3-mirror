# Maintainer: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=ers-node
pkgver=0.15
pkgrel=1
pkgdesc="The Entity Registry System node implementation"
arch=('i686' 'x86_64')
url="http://ers-devs.github.io/ers/"
license=('GPL')
depends=('couchdb' 'python2-couchdbkit' 'python2-rdflib' 'python2-requests')
install=ers-node.install
source=("https://github.com/ers-devs/ers-node/archive/${pkgver}.tar.gz" 
	"ers-node.service"
	"ers-node.tmpfiles")
md5sums=('3027c63a225f2f51de9350ab6c8b2e75'
         '2efbd432bcdb52e1d7e720b302cc6547'
         '985206e54c767c14b289f811121c3607')

package() {
	cd "$srcdir/ers-node-${pkgver}"
	python2 setup.py install --prefix="$pkgdir/usr" || return 1

	rm -rf $pkgdir/etc/default/ $pkgdir/var/run

	mkdir -p $pkgdir/etc/ers-node
	mkdir -p $pkgdir/var/lib/ers-node
	mkdir -p $pkgdir/var/log/ers-node
	mkdir -p $pkgdir/var/run/ers-node

	install -Dm0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm0644 $srcdir/$pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
}

