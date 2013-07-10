# Contributor: Wolfgang Bumiller <archbsd at bumiller dot com>
pkgname=pkgdepdb
pkgver=0.1.2
pkgrel=2
_pkgver=0.1.2.1
pkgdesc="maintain library dependencies of packages in a database"
license=(BSD)
arch=(i686 x86_64)
url=http://github.com/Blub/pkgdepdb
depends=(libarchive)
makedepends=(llvm)
conflicts=('readpkgelf')
replaces=('readpkgelf')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Blub/${pkgname}/archive/${_pkgver}.tar.gz")
sha1sums=('90d1221a86e3bc65e0ab97cb480d3f74541b024f')

build() {
	cd $pkgname-$_pkgver
	make SYSCONFDIR=/etc
}

package() {
	cd $pkgname-$_pkgver
	make DESTDIR="${pkgdir}" \
		SYSCONFDIR=/etc \
		PREFIX=/usr \
		install
}
