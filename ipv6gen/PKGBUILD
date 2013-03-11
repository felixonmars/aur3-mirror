# Maintainer: Fallback <phlegethon|@|lavabit.com>

pkgname=ipv6gen
pkgver=1.0
pkgrel=1
pkgdesc='IPv6 prefix generator'
arch=('any')
license=('GPL')
url="https://code.google.com/p/ipv6gen/"
depends=('perl')
source=(http://ipv6gen.googlecode.com/files/ipv6gen-1.0.tgz)
md5sums=('4527f7a09169bf5fca9413b957e57608')

package() {
	install -D -m 775  "${srcdir}/$pkgname/$pkgname.pl" "$pkgdir/usr/bin/$pkgname"
	install -D -m 775  "${srcdir}/$pkgname/check-overlap.pl" "$pkgdir/usr/bin/check-overlap"
}
