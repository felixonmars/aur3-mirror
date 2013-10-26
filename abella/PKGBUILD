# Maintainer: perlawk
pkgname=abella
pkgver=2.0.1
pkgrel=1
pkgdesc='Abella is an interactive theorem prover based on lambda-tree syntax. It is a subset of Lambda Prolog'
url='http://abella-prover.org/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('ocaml')
source=("http://abella-prover.org/distributions/${pkgname}-${pkgver}.tar.gz")

build () {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 emacs/abella.el emacs/lprolog.el "$pkgdir/usr/share/emacs/site-lisp/"
	cp abella "$pkgdir/usr/bin/"
}

md5sums=('60c67bbfc0539eabebc0f4c6eb3ac7bd')
