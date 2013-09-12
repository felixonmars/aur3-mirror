# Maintainer: Paul 'opatut' Bienkowski <paulbienkowski@aol.com>
pkgname=nottoomuch-addresses
pkgver=20120222
pkgrel=1
pkgdesc="A tool to provide email address matches for given substring."
arch=(x86_64 i386)
url="http://www.guru-group.fi/~too/nottoomuch/nottoomuch-addresses/"
license=('GPL')
source=("http://www.guru-group.fi/~too/nottoomuch/nottoomuch-addresses.sh")
md5sums=('b0d1faa0504e6a1e8136c9d6f192e424')

package() {
	cd "$srcdir"
    install -Dm 755 nottoomuch-addresses.sh "$pkgdir/usr/bin/nottoomuch-addresses.sh"
}
