# Mantainer: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>
pkgname=ispell-pt-br
pkgver=2.4
_foldername=br.ispell-2.4 
pkgrel=1
pkgdesc="Brazilian portuguese dictionary for ispell."
url="http://www.ime.usp.br/~ueda/br.ispell/"
license=('GPL')
groups=('office')
depends=('ispell')
arch=('any')
source=(http://www.ime.usp.br/~ueda/br.ispell/br.ispell-2.4.tar.gz)
md5sums=('241d9e2fefb92ea74f13c1e07d0b4e7b ')

build() {

  cd ${srcdir}/${_foldername}

#  sed -i -e 's|/usr/bin/gawk|/bin/awk|' Makefile
  make || return 1
  mkdir -p "$startdir/pkg/usr/lib/ispell"

  cp "${srcdir}/${_foldername}/br.aff" "$startdir/pkg/usr/lib/ispell/pt-br.aff"
  cp "${srcdir}/${_foldername}/br.hash" "$startdir/pkg/usr/lib/ispell/pt-br.hash"

}


