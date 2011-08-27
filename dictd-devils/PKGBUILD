# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-devils
_mypkgname=devils-dict-pre
pkgver=0
pkgrel=3
pkgdesc="The Devil's Dictionary for dict"
arch=(i686 x86_64)
url="http://www.dict.org/"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tar.gz")
md5sums=('5fa37007d2309908ebfc3e6412150e17')


build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/devils.dict.dz $startdir/pkg/usr/share/dictd/devils.dict.dz
  install -D -m 0644 $startdir/src/devils.index $startdir/pkg/usr/share/dictd/devils.index
}
