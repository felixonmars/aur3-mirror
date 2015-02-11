# Maintainer: Cory Giles <mail@corygil.es>

pkgname=geniatagger
pkgver=3.0.1
pkgrel=1
pkgdesc="GENIA POS tagger for biomedical text."
arch=('i686' 'x86_64')
url="http://nactem.ac.uk/tsujii/"
license=('BSD')
md5sums=('d7cc73d996a15f73ff8535ae173d2222'
         'a11a44fb5046d89481ab8a74a9296792')

source=(
    http://www.nactem.ac.uk/tsujii/GENIA/tagger/${pkgname}-${pkgver}.tar.gz
    ${pkgname}-${pkgver}.patch
)
    
prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/{usr/bin,usr/share/geniatagger}
    cp -r models_chunking models_medline models_named_entity morphdic $pkgdir/usr/share/geniatagger
    cp geniatagger $pkgdir/usr/bin
}
