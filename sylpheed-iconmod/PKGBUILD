# Maintainer: mykey <mykey@mykey.de>
pkgname=sylpheed-iconmod
pkgver=3.4.2
pkgrel=1
pkgdesc="Lightweight and user-friendly e-mail client including the coonsden.com icon pack."
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('gpgme' 'gtk2' 'gtkspell')
makedepends=('compface')
provides=('sylpheed')
conflicts=('sylpheed' 'sylpheed-beta')
options=('libtool')

source=("http://sylpheed.sraoss.jp/sylpheed/v3.4/sylpheed-$pkgver.tar.bz2"
        "Sylpheed3.0_icon-set.tar.gz")

md5sums=('d4e53489763ff2cb575ab02890d91dc9'
	 'd6bbac2e7b5860e4ebcfa3d9326a1727')

build() {
	#cp -r "$srcdir/Sylpheed3.0_icon-set/src" "$srcdir/sylpheed-$pkgver"
	cp -rf "$srcdir/src/icons/" "$srcdir/sylpheed-$pkgver/src/"
	
	cd "$srcdir/sylpheed-$pkgver"
	#./autogen.sh || return 1
	./configure --prefix=/usr --enable-ldap || return 1
	
	make || return 1
}

package() {
	cd "$srcdir/sylpheed-$pkgver"
	make DESTDIR="$pkgdir" install || return 1
}
