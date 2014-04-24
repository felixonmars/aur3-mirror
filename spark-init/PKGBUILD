# Maintainer: Jack Frost <fbt@fleshless.org>

pkgname='spark-init'
pkgdesc='A simple init written in bash'
license='BSD'
pkgver=1.2
pkgrel=3
arch='any'
url='https://github.com/fbt/spark'

source=( "https://github.com/fbt/spark/archive/${pkgver}.zip" )
md5sums=('14d22eb06463456abee152fa072e2b93')

package() {
	cd "${srcdir}/spark-${pkgver}"

	mkdir -pm 755 "$pkgdir/sbin" "$pkgdir/etc/spark"

	install -Dm755 bin/spark-init "$pkgdir/sbin"
	install -Dm755 bin/spark-shutdown "$pkgdir/sbin/spark-shutdown"

	cd "$pkgdir"
}
