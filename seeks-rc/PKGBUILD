# Maintainer: Splashy < splash at open-web dot fr>

pkgname=seeks-rc
pkgver=0.2.4rc1
pkgrel=1
pkgdesc="A design that allows users to share their queries to existing search engines"
arch=('i686' 'x86_64')
url="http://www.seeks-project.info"
license=('custom:"AGPL3"')
depends=('pcre' 'curl' 'libxml2' 'libevent')
makedepends=('docbook2x')
conflicts=('seeks' 'seeks-git')
source=("http://www.seeks-project.info/site/releases/seeks_solo_stable-$pkgver.tar.gz")
md5sums=('0f543238a963f80fed8d637e65487e05')

build() {
	cd $srcdir/seeks

	./autogen.sh || return 1
	./configure --prefix=/usr --sysconfdir=/etc --enable-httpserv-plugin || return 1
	sed -i s/-Wl,--as-needed// config.status || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
	mkdir -p $pkgdir/usr/share/licenses/seeks && cp COPYING $pkgdir/usr/share/licenses/seeks
}


