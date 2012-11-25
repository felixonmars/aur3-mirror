# Maintainer:  Matthew Monaco <net 0x01b dgbaley27
# Contributor: TheGrudge <net gmx andi.clemens>

_pypkg=pysnmp-mibs
_python=python

pkgname=$_python-$_pypkg
pkgver=0.1.4
pkgrel=2
pkgdesc="SNMP library for Python (precompiled MIBs)"
url="http://sourceforge.net/projects/$_pypkg/"
license=('BSD')
arch=('any')
depends=("$_python" "$_python-pysnmp")
makedepends=("$_python-distribute")
source=(http://downloads.sourceforge.net/sourceforge/${_pypkg/-mibs/}/$_pypkg-$pkgver.tar.gz)
md5sums=('a37e2fe791c743263279d4546312f3c0')

package() {

	cd "$srcdir/$_pypkg-$pkgver"

	$_python setup.py install --root="$pkgdir"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# package python module only
	rm -fr "$pkgdir/usr/bin"
}

# vim: set noet :
