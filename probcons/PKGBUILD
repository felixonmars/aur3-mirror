# Maintainer: Mick Elliot <micke at sfu dot ca>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=probcons
pkgver=1.12
origver=1.12
pkgrel=1
pkgdesc="Probabilistic consistency-based multiple alignment of amino acid sequences"
arch=('i686' 'x86_64')
url="http://probcons.stanford.edu"
license=('custom')
depends=('gcc-libs')
source=($url/probcons_v1_12.tar.gz PATCH LICENSE)
md5sums=('a658e24b07aaa9e8194317345133ac9d' '95c0d289fea020abc9aca84a4bd60135' '07d5ae99e362fdc62c251712dba9c6d0')

build() {
  patch -d $srcdir/probcons < PATCH || return 1
  
  cd $startdir/src/probcons
  if [ "${CARCH}" = "i686" ]; then
    make CFLAGS=" -march=i686 -mtune=generic -O2 -pipe" || return 1
  else
    make CFLAGS=" -march=x86-64 -mtune=generic -O2 -pipe" || return 1
  fi

  install -D -m755 probcons $startdir/pkg/usr/bin/probcons
  install -D -m755 compare $startdir/pkg/usr/bin/compare
  install -D -m755 project $startdir/pkg/usr/bin/project
  install -D -m755 makegnuplot $startdir/pkg/usr/bin/makegnuplot 
  install -D -m644 ../LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
