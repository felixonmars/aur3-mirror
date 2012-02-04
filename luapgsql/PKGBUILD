# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>
# Maintainer: Laszlo Papp <djszapi at archlinux us>

pkgname=luapgsql
pkgver=20080401
arch=('i686' 'x86_64')
pkgrel=2
pkgdesc="A lightweight binding of libpq (standard PostgreSQL C client library)"
url="http://luaforge.net/projects/luapgsql/"
license=('GPL')
depends=('postgresql-libs')
source=(http://luaforge.net/frs/download.php/3280/$pkgname.$pkgver.tar.gz patch.diff)
md5sums=('95e90bb49325839501281bd385c885ca' '531fd2520744a551169c1daf5dae4a88')

build() {
	cd $srcdir/
	patch -p0 < patch.diff
	cd $pkgname/
	make || return 1
	install -D -m755 pgsql.so $pkgdir/usr/lib/lua/5.1 || return 1
}
