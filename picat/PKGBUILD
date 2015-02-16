# Maintainer: perlawk
pkgname=picat
pkgver=08
pkgrel=1
pkgdesc="Picat is a general-purpose language that incorporates features from logic programming, functional programming, and scripting languages."
arch=('x86_64' 'i686')
url="http://picat-lang.org/"
license=('custom:bprolog')
depends=()
if [ $CARCH == 'x86_64' ]; then
  source=("http://picat-lang.org/download/picat08_linux64.tar.gz")
	md5sums=(SKIP)
else
	source=("http://picat-lang.org/download/picat08_linux.tar.gz")
	md5sums=(SKIP)
fi

install=picat.install

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/picat"
  cd "${srcdir}/Picat"
	cp picat "$pkgdir/usr/bin"
 	cp -a lib doc exs "$pkgdir/usr/lib/picat"
}
