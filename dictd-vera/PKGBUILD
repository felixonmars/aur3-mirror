# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-vera
pkgver=1.9
_mypkgname=dict-vera-${pkgver}-pre
pkgrel=3
pkgdesc="V.E.R.A. -- Virtual Entity of Relevant Acronyms for dict"
arch=(i686 x86_64)
url="http://home.snafu.de/ohei/vera/vueber-e.html"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tar.gz")
md5sums=('d0c9aea46f5e4548b619362ee31a5651')

build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/vera.dict.dz $startdir/pkg/usr/share/dictd/vera.dict.dz
  install -D -m 0644 $startdir/src/vera.index $startdir/pkg/usr/share/dictd/vera.index
}
