# Developer: Jonny Tyers
# Maintainer: Enno Lohmeier <e.lohmeier@gmx.de>
pkgname=pcachefs
pkgver=0.1
pkgrel=1
pkgdesc="Persistent-caching FUSE filesystem"
arch=("any")
url="http://code.google.com/p/pcachefs"
license=("Apache License 2.0")
depends=("python2-fuse")
source=("http://pcachefs.googlecode.com/files/$pkgname-$pkgver.tgz"
	"pcachefs-launcher")
md5sums=('d7488eae4af881dc53d487b37f1290d2'
         'c6b6d0a63ca9259095c4f0e4e61c80ae')
package() {
	install -dv "${pkgdir}/opt/pcachefs"
	install -dv "${pkgdir}/usr/bin"

	cd "$srcdir/$pkgname"

	install -Dm755 pcachefs.py "${pkgdir}/opt/pcachefs"
	install -Dm755 ranges.py "${pkgdir}/opt/pcachefs"

	install -Dm644 README "${pkgdir}/opt/pcachefs"
	install -Dm644 LICENSE "${pkgdir}/opt/pcachefs"

	install -Dm755 "${srcdir}/pcachefs-launcher" "${pkgdir}/usr/bin/pcachefs"
}
