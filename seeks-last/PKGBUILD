# Maintainer: Splashy < splash at open-web dot fr>
# Co-maintainer: Gitus < git at shroomrider dot com >

pkgname=seeks-last
pkgver=0.2.5b
pkgrel=4
pkgdesc="A design that allows users to share their queries to existing search engines"
arch=('i686' 'x86_64')
url="http://www.seeks-project.info"
license=('custom:"AGPL3"')
depends=('pcre' 'curl' 'libxml2' 'libevent' 'opencv')
makedepends=('docbook2x' 'pkg-config')
conflicts=('seeks-git' 'seeks')
source=("http://sunet.dl.sourceforge.net/project/seeks/solo/seeks_solo_stable-$pkgver.tar.gz")
md5sums=('8086a47cdcf064b1582aa298c7288e68')

build() {
	cd $srcdir/seeks

	./autogen.sh || return 1
	./configure --prefix=/usr --sysconfdir=/etc --enable-httpserv-plugin --enable-image-websearch-plugin || return 1
	sed -i s/-Wl,--as-needed// config.status || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
	mkdir -p $pkgdir/usr/share/licenses/seeks && cp COPYING $pkgdir/usr/share/licenses/seeks || return 1
	cd $pkgdir/usr/share/seeks/plugins && ln -s websearch img_websearch || return 1
}







