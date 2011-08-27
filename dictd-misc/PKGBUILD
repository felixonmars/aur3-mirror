# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-misc
pkgver=1.5b
_mypkgname=dict-misc-${pkgver}-pre
pkgrel=3
pkgdesc="Easton's 1897 Bible Dictionary for dict"
arch=(i686 x86_64)
url="http://www.dict.org/"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tar.gz")
md5sums=('84445acccaa120288a6bda0d251d5a92')


build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/easton.dict.dz $startdir/pkg/usr/share/dictd/easton.dict.dz
  install -D -m 0644 $startdir/src/easton.index $startdir/pkg/usr/share/dictd/easton.index
  install -D -m 0644 $startdir/src/hitchcock.dict.dz $startdir/pkg/usr/share/dictd/hitchcock.dict.dz
  install -D -m 0644 $startdir/src/hitchcock.index $startdir/pkg/usr/share/dictd/hitchcock.index
  install -D -m 0644 $startdir/src/world95.dict.dz $startdir/pkg/usr/share/dictd/world95.dict.dz
  install -D -m 0644 $startdir/src/world95.index $startdir/pkg/usr/share/dictd/world95.index
}
