## Maintainer : Konstantin Nikiforov <helllamer@gmail.com>

prog=jsonpp
pkgname=${prog}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A command line JSON pretty printer."
arch=('x86_64')
url="https://github.com/micrypt/jsonpp"
depends=()
license=('MIT')
conflicts=('jsonpp')
provides=$conflicts
source=("http://projects.somethingsimilar.com/jsonpp/downloads/$prog-$pkgver-linux-${CARCH}.zip")
md5sums=('8e072828425e68ffa46d949ff938a222')

package() {
	mkdir -p $pkgdir/usr/bin/ $pkgdir/usr/share/$prog/
	cd $srcdir/$prog-$pkgver
	install -D -m755 $prog $pkgdir/usr/bin/
	install -D -m644 README.md $pkgdir/usr/share/$prog/
}
