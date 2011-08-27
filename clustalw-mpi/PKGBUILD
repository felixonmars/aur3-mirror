# Maintainer: Mick Elliot <micke at sfu dot ca>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=clustalw-mpi
pkgver=0.13
origver=0.13
pkgrel=1
pkgdesc="An MPI implementation of the popular multiple sequence alignment tool ClustalW"
arch=('i686' 'x86_64')
url="http://www.bii.a-star.edu.sg/achievements/applications/clustalw/index.php"
license=('custom')
depends=('openmpi' 'glibc')
makedepends=('make')
source=(http://www.bii.a-star.edu.sg/docs/software/$pkgname-$pkgver.tar.gz)
md5sums=('f4c24336764eff6be73322bfc7167f16')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D -m755 clustalw-mpi $startdir/pkg/usr/bin/clustalw-mpi
  install -D -m644 README.clustalw-mpi $startdir/pkg/usr/share/licenses/$pkgname/README.clustalw-mpi
}
