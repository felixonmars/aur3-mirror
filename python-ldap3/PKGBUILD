# Maintainer: Matthew Monaco < cx monaco matt >

pkgname=python-ldap3
pkgver=0.9.8.4
_commit=50d8d9935aee79c4e4a4681bcbb557321316049e
pkgrel=1
pkgdesc="LDAPv3 pure Python client"
arch=("any")
url="https://github.com/cannatag/ldap3"
license=(GPL3)
depends=(python-pyasn1)
makedepends=(python-setuptools)
source=("$pkgname"::"git+https://github.com/cannatag/ldap3.git#commit=$_commit")
md5sums=(SKIP)

#pkgver() {
#	cd "$srcdir/$pkgname"
#	local _ver="$(git describe --tags)"
#	printf "%s" "${_ver//-/.}"
#}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
