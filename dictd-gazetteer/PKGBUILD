# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=dictd-gazetteer
pkgver=1.2
_mypkgname=dict-gazetteer-${pkgver}-pre
pkgrel=3
pkgdesc="The original U.S. Gazetteer Place and Zipcode Files for dict"
arch=(i686 x86_64)
url="http://www.dict.org/"
license=('GPL')
depends=(dictd)
source=("ftp://ftp.dict.org/dict/pre/$_mypkgname.tar.gz")
md5sums=('d67cd81e90bc98e738c19693a97ab9e2')

build() {
  cd $startdir/src/
  install -D -m 0644 $startdir/src/gazetteer.dict.dz $startdir/pkg/usr/share/dictd/gazetteer.dict.dz
  install -D -m 0644 $startdir/src/gazetteer.index $startdir/pkg/usr/share/dictd/gazetteer.index
}
