# Maintainer: aksr <aksr at t-com dot me>
pkgname=mktrfn
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="The mktrfn program creates troff font description files for neatroff from AFM (Adobe Font Metrics) files."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('neatroff' 'neatpost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://litcave.rudi.ir/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('a44ae811e38ebb1fe9490746de7cf8fc')
sha1sums=('57610bb924c366984b8fb11540b0e09c76f2273c')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make all
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 mktrfn $pkgdir/usr/bin/mktrfn
    install -Dm755 gen.sh $pkgdir/usr/share/doc/$pkgname/gen.sh
    install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README

}

