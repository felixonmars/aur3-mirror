# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mget
pkgver=0.1.5
pkgrel=1
pkgdesc="Multithreaded metalink/file/website downloader (like Wget) and C library"
arch=(i686 x86_64)
url="http://rockdaboot.github.io/mget/"
license=('GPL')
depends=(gettext gnutls libidn libunistring)
makedepends=(git libxslt)
source=("git://github.com/rockdaboot/mget.git#commit=cdb8cd")
md5sums=(SKIP)

build() {
	cd "$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --enable-man
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

# Broken :(
#check() {
#    cd "$pkgname"
#    make check
#}
