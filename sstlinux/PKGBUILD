pkgname=sstlinux
pkgver=1.0.0
pkgrel=1
arch=('i686')
license=('GPL')
pkgdesc="Classic text based Super Star Trek"
url="http://www.almy.us/sst.html"
depends=()
makedepends=(gcc sed)
source=(http://www.almy.us/files/sstlinux.tar.gz http://www.almy.us/files/sstsrc.zip)
md5sums=('1207a2951997a0a71a1e2b6c48481894' 'bd88bb89e8f968b2f8216d2e45792411')

build() {
  cd $startdir/src/
  cp sst sst-orig
  sed 137s#sst.doc#/usr/share/sstrek/sst.doc# sst-orig > sst
  mkdir -p $startdir/pkg/usr/bin
  cp sst $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/sstrek
  cp sst.doc $startdir/pkg/usr/share/sstrek
}
