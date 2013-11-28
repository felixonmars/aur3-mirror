# Contributor: Kosyak <ObKo@mail.ru>

pkgname=libmaia-qt5-git
pkgver=20130225
pkgrel=1
pkgdesc="XML-RPC lib for Qt"
arch=(any)
url="https://github.com/wiedi/libmaia"
license=("custom")
makedepends=("git")
depends=("qt5-base")
provides=("libmaia")
conflicts=("libmaia")

source=("git+https://github.com/wiedi/libmaia.git"
        "libmaia_shared_and_headers.patch")
md5sums=("SKIP"
         "309ac6156435c2e115b203356a839cd2")

_gitname="libmaia"

build() {
	cd "$srcdir/$_gitname"
	patch -p1 -i "$srcdir/libmaia_shared_and_headers.patch"
	qmake-qt5 PREFIX="$pkgdir/usr"
	make || return 1
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install || return 1
}
