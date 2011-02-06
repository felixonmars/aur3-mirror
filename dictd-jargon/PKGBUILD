# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-jargon
pkgver=4.3.1
_mypkgname=dict-jargon_${pkgver}
pkgrel=3
pkgdesc="Jargon lexicon for dict"
arch=(i686 x86_64)
url="http://www.dict.org/"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tgz")
md5sums=('dc1154d9cdbfa9b083e78f2e732476cd')

build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/jargon.dict.dz $startdir/pkg/usr/share/dictd/jargon.dict.dz
  install -D -m 0644 $startdir/src/jargon.index $startdir/pkg/usr/share/dictd/jargon.index
}
