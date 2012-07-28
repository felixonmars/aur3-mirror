# Maintainer: Shanto <shanto@hotmail.com>

pkgname=eclipse-dbeaver
pkgver=1.6.0
pkgrel=1
pkgdesc="Universal database tool for developers and administrators (Eclipse Plugin)"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("Freeware")
depends=('eclipse')
makedepends=('unzip')
optdepends=('mysql-jdbc' 'postgresql-jdbc' 'sqlite-jdbc')
source=(http://dbeaver.jkiss.org/files/dbeaver-$pkgver-plugin.zip)
md5sums=('216a2822cbf86acb53e64069b73339a3')

build() {
	_dest=$pkgdir/usr/share/eclipse/dropins/${pkgname/eclipse-}
	mkdir -p $_dest/eclipse/plugins
	cd $_dest/eclipse/plugins
	unzip "$srcdir/$(basename ${source[0]})"
}
