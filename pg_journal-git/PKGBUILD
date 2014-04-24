# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=pg_journal
pkgname=$_pkgname-git
pkgver=v0.1.1.10.g1c78cfe
pkgrel=1
pkgdesc="Postgres module that sends logged messages to the systemd journal"
arch=("i686" "x86_64")
url="http://pgxn.org/dist/pg_journal/"
license=("custom:PostgreSQL")
depends=("libsystemd" "openssl" "postgresql")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git://github.com/intgr/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
