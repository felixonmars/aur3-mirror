# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=molmol
pkgver=2k.2.0
pkgrel=1
pkgdesc="Publication-quality molecular visualization package"
arch=(i686)
url="http://hugin.ethz.ch/wuthrich/software/molmol/index.html"
license=('GPL')
makedepends=('openmotif' 'libjpeg' 'libtiff' 'libpng' 'zlib')
source=(ftp://ftp.mol.biol.ethz.ch/software/MOLMOL/unix-gzip/$pkgname-$pkgver-src.tar.gz  ftp://ftp.mol.biol.ethz.ch/software/MOLMOL/unix-gzip/$pkgname-$pkgver-doc.tar.gz pjf_RH9_molmol2k2.diff)
md5sums=('e1f4416d8041a67fa08cadb03ed91c7c' '517545b60b0179ab691a679ed29903a7' '52b16a9f8b5a23f8012e63250234a5f3')

build() {
  cd $startdir/src/
  patch -p1 < ../pjf_RH9_molmol2k2.diff
  ln -s makedef.lnx makedef

  sed -i \
     -e "s:/bin/ksh:/bin/sh:" \
     -e "s:^MOLMOLHOME.*:MOLMOLHOME=/usr/share/$pkgname:" molmol
  sed -i \
     -e "s:^MCFLAGS.*:MCFLAGS = -march=i686 -O2 -pipe -fomit-frame-pointer:" \
     -e "s:^CC.*:CC = gcc:" makedef

  make -j1|| return 1
  mkdir -p $startdir/pkg/usr/bin
  cp molmol $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/$pkgname
  cp src/main/molmol $startdir/pkg/usr/share/$pkgname/molmol.lnx
  cp -r auxil help macros man setup tips $startdir/pkg/usr/share/$pkgname

}
