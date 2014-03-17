# Maintainer:  Matthew Monaco <net 0x01b dgbaley27
# Contributor: TheGrudge <net gmx andi.clemens>

_pypkg=pysnmp
_python=python2

pkgname="$_python-$_pypkg"
pkgver=4.2.5
pkgrel=2
pkgdesc="SNMP library for Python"
url="http://sourceforge.net/projects/$_pypkg/"
license=(BSD)
arch=(any)
depends=("$_python" "$_python-pyasn1")
makedepends=("$_python-distribute")
optdepends=("$pkgname-mibs")
replaces=(pysnmp)
source=(http://downloads.sourceforge.net/sourceforge/$_pypkg/$_pypkg-$pkgver.tar.gz)
md5sums=(1f75d3e392a050e84348904fc1be3212)

package() {

	cd "$srcdir/$_pypkg-$pkgver"

	$_python setup.py install --root="$pkgdir"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# package python module only
	rm -fr "$pkgdir/usr/bin"
}

# vim: set noet :
