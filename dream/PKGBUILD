# Maintainer:  perlawk
pkgname=dream
pkgver=1.6
pkgrel=1 
pkgdesc="Dream:Scheme interpreter, written entirely in assembly language (GAS syntax.), R4RS standard, SICP oriented."
url="https://web.archive.org/web/20070321065718/http://www.stripedgazelle.org/joey/dream.html"
arch=('i686' 'x86_64')
license=('custom license')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=( "https://web.archive.org/web/20070321065718/http://www.stripedgazelle.org/cgi-bin/wiki_joey/dreamx86.tar.gz" )

build() {
  cd "$srcdir/$pkgname"_x86
	sed -i 's/POWER=6/POWER=6 --32/; s/-ffree/-m32 -ffree/;' Makefile
  make 
}

package()
{
  cd "$srcdir/$pkgname"_x86
  install -Dm755 dream $pkgdir/usr/bin/dream
}
md5sums=('92c38e79c86875600aac0cbcc398d133')
