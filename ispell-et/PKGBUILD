# Contributor: Jaagup Repän <jrepan@gmail.com>

pkgname=ispell-et
pkgver=20070530
pkgrel=1
pkgdesc="Estonian dictionary for ispell"
arch=(i686 x86_64)
url="http://www.meso.ee/~jjpp/speller/"
license=(LGPL)
depends=(ispell)
source=(http://www.meso.ee/~jjpp/speller/estonian.dict http://www.meso.ee/~jjpp/speller/estonian.aff)
md5sums=(2573564eb8ae86b25c0681156446f604 34bcab9332cdea392d54bc67b8aa9312)

build() {
  mkdir -p $startdir/pkg/usr/lib/ispell
  buildhash estonian.dict estonian.aff $startdir/pkg/usr/lib/ispell/estonian.hash 2> /dev/null
  cp estonian.aff $startdir/pkg/usr/lib/ispell/
}
