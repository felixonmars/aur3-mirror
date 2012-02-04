# Contributor: Jan Smydke <jan.smydke@jh-inst.cas.cz>
pkgname=dmatrices
pkgver=0.4
pkgrel=2
pkgdesc="A small ruby lib for double precision vectors and general and symmetric matrices"
arch=('i686' 'x86_64')
url="http://blue.jh-inst.cas.cz/~smydke/dmatrices"
license=('custom:BSD')
depends=('ruby' 'gcc-libs' 'blas' 'lapack')
source=(http://blue.jh-inst.cas.cz/~smydke/dmatrices/releases/$pkgname-$pkgver.tar.gz)
md5sums=('84e6bdd50d17333e683788085781ddaa')

build() {
      cd "$srcdir/$pkgname-$pkgver"

	ruby extconf.rb || return 1
	make || return 1
	make DESTDIR="$pkgdir" install

	install -D -m644 $startdir/LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
