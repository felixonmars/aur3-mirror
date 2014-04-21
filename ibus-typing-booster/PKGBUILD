pkgname=ibus-typing-booster
pkgver=1.2.10
pkgrel=1
pkgdesc="Autocomplete Input Method for IBUS"
arch=('any')
url="https://git.fedorahosted.org/cgit/ibus-typing-booster"
license=('GPL3')
depends=('ibus' 'libtranslit')
source=(${url}.git/snapshot/ibus-typing-booster-${pkgver}.tar.gz package-$pkgver-$pkgrel.patch)
md5sums=('236875f7136374ec69d10ccc6db3be0f'
         'a466b66981a6975f34ca4a222fdeed9f')

build() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"
        patch -p1 -i $srcdir/package-$pkgver-$pkgrel.patch
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"
	make DESTDIR="$pkgdir/" install
}
