# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-elements
_mypkgname=elements-20001107-pre
pkgver=0
pkgrel=3
pkgdesc="The elements database for dict"
arch=(i686 x86_64)
url="http://www.dict.org/"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tar.gz")
md5sums=('84f116609be2716134cdc08de3e8cb7a')


build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/elements.dict.dz $startdir/pkg/usr/share/dictd/elements.dict.dz
  install -D -m 0644 $startdir/src/elements.index $startdir/pkg/usr/share/dictd/elements.index
}
