# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>
_pkgname=ripole
pkgname="${_pkgname}-dev"
pkgver=0.2
pkgrel=1
pkgdesc="ripOLE is a small program/library designed to pull out attachments from OLE2 data files (ie, MS Office documents)"
license=('BSD')
arch=('i686' 'x86_64')
url="http://www.pldaniels.com/ripole"
source=("http://www.pldaniels.com/ripole/$_pkgname-$pkgver-dev.tar.gz" "ole.patch")
md5sums=('9d6ba43a0627379e6edf3f2412d08863'
         '9d03f9755a5bfd39c37a01289ebc2a15')

build() {
	cd "$srcdir/$_pkgname-$pkgver-dev"

    patch -p0 < ../ole.patch
	make clean || return 1
	make || return 1
	}

package() {
	cd "$srcdir/$_pkgname-$pkgver-dev"

	install -D -m 755 ripole ${pkgdir}/usr/bin/ripole
	}
