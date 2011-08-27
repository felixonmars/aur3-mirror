# Maintainer: David Watzke <david@watzke.cz>

pkgname=pion-net
pkgver=4.0.5
pkgrel=1
pkgdesc="a C++ development library for implementing lightweight HTTP interfaces"
url="http://www.pion.org/projects/pion-network-library"
arch=('i686' 'x86_64')
license=('custom:Boost')
depends=('boost-libs' 'boost' 'log4cpp')
source=("http://www.pion.org/files/$pkgname-$pkgver.tar.bz2"
	"$pkgname-$pkgver-build.patch")
sha256sums=('4fa6759676c5ec1d4d79a272d545930486d6c8c94790a84fe7645577be29cc5b'
            '67ccddca4144fbd8e89043048a517cf046f238156ed174474db8e09afc153832')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -p1 -i "$srcdir/$pkgname-$pkgver-build.patch"

	# override configure bug (forces debug even when nobody asked for it)
	sed -i "s/ -ggdb//g;s/ -DNDEBUG//g" configure

	./configure --prefix=/usr --disable-doxygen-doc --with-log4cpp

	find -name Makefile -print0 | xargs -0 \
	sed -i -r '/^C(XX)?FLAGS/ s/$/ -DBOOST_FILESYSTEM_VERSION=2/' Makefile

	# override Makefile bug
	sed -i "/docs:/ s/doxygen-doc//" Makefile

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	# install license
	install -D -m0755 COPYING "$pkgdir/usr/share/licenses/$pkgname/Boost"
}
