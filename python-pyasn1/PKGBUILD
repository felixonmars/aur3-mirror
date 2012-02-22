# Maintainer:  Matthew Monaco <net 0x01b dgbaley27
# Contributor: TheGrudge <net gmx andi.clemens>
# Contributor: Jesse Young <com gmail jesse.young>

_pypkg=pyasn1
_python=python

pkgname=$_python-$_pypkg
pkgver=0.1.2
pkgrel=2
pkgdesc="ASN.1 library for Python"
url="http://sourceforge.net/projects/$_pypkg/"
license=('BSD')
arch=('any')
depends=("$_python")
makedepends=("$_python-distribute")
source=(http://downloads.sourceforge.net/sourceforge/$_pypkg/$_pypkg-$pkgver.tar.gz)
md5sums=('a7c67f5880a16a347a4d3ce445862a47')

package() {

	cd "$srcdir/$_pypkg-$pkgver"

	$_python setup.py install --root="$pkgdir"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set noet :
