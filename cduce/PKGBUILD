# Maintainer: François Lebigre <francois.lebigre@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=cduce
pkgver=0.5.3
pkgrel=1
pkgdesc="A modern XML-oriented functional language with innovative features."
url="http://www.cduce.org/"
arch=('i686' 'x86_64')
license="MIT"
depends=('ocaml>=3.10' 'ocaml-findlib>=1.0.3' 'ulex>=1.0' 'pcre-ocaml>=5.13.0' 'ocamlnet>=0.98')
optdepends=('pxp: XML parser support'
			'ocurl: external URLs support')
source=(http://www.cduce.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('5506326db28419b3f578ff225417448f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/man" DOCDIR="$pkgdir/usr/doc/cduce" CGI_DIR="$pkgdir/var/www/cgi-bin" HTML_DIR="$pkgdir/var/www/html" SESSION_DIR="$pkgdir/tmp/cduce_sessions" install
}
