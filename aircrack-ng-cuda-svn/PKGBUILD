# Contributor: yannsen <ynnsen@gmail.com>

pkgname=aircrack-ng-cuda-svn
pkgver=1550
pkgrel=6
pkgdesc="Wifi security suite - WEP / WPA crack tools -- supports CUDA"
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPL2')
depends=('openssl' 'wireless_tools' 'libtool' 'cuda>=2.2' 'sqlite3' 'iw')
makedepends=('subversion' 'autoconf')
provides=('aircrack-ng' 'aircrack-ng-svn' 'aircrack-ng-cuda')
conflicts=('aircrack-ng' 'aircrack-ng-svn' 'aircrack-ng-cuda')
source=()
md5sums=()

_svnmod=aircrack-ng-cuda
_svntrunk="http://trac.aircrack-ng.org/svn/branch/aircrack-ng-cuda/"

build() {
  cd $srcdir
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/${_svnmod}-build" ]; then
    rm -rf "${srcdir}/${_svnmod}-build"
  fi

  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  # setting the right location of nvcc
  sed -i s#/bin/nvcc#/usr/bin/nvcc#g src/Makefile || return 1
  sed -i "s/--compiler-options -fno-strict-aliasing --host-compilation=C/--compiler-options -fno-strict-aliasing --host-compilation=C --compiler-options -fpermissive/" src/Makefile || return 1

  # BUILD
  make prefix=/usr CUDA=true sqlite=true DESTDIR=$pkgdir/ install  || return 1
}
