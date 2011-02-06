# Contributor: Cedric Chabanois <cchabanois@gmail.com>

pkgname=dotclear
pkgver=2.2.2
pkgrel=1
pkgdesc="Blog Tool and Publishing Platform"
arch=('i686' 'x86_64')
url=("http://dotclear.org/")
install=dotclear.install
license=('GPL2')
depends=('php' 'php-gd')
optdepends=('libmysqlclient: MySQL backend'
	    'postgresql-libs: PostgreSQL backend'
	    'sqlite3: SQLite backend')
source=(http://download.dotclear.org/latest/dotclear-2.2.2.tar.gz)
md5sums=('1068e8924ae1f3ee84c14854bed97f29')
build() {
	install -d ${pkgdir}/srv/http/dotclear
	cp -r ${srcdir}/dotclear/* ${pkgdir}/srv/http/dotclear
	chown -R http:http ${startdir}/pkg/srv/http/dotclear/{cache,public,inc,themes,plugins}
}
