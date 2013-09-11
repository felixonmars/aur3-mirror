# Contributor: josedavim <josedtascon@gmail.com>

pkgname=toro
pkgver=29
pkgrel=1
pkgdesc="Tree-based netwORk Optimizer for SLAM systems"
arch=('i686' 'x86_64')
url="http://www.openslam.org/toro.html"
license=('custom')
makedepends=('gcc-libs' 'subversion')
depends=('doxygen>=1.5.0')
optdepends=()
source=()
md5sums=()

_svntrunk="https://www.openslam.org/data/svn/toro/"
_svnmod="toro"
folder=trunk
build() {
  msg "Starting SVN checkout..."
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  msg "Building and installing TORO..."
  cd "$srcdir/$pkgname/$folder"
  make
  cd "./doc"
  doxygen toro.dox
}

package ()
{
  cd "$srcdir/$pkgname/$folder"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/share/doc/toro
  cp -a ./toro toro3d $pkgdir/usr/bin
  cp -a ./libtoro.a ./libtoro3d.a $pkgdir/usr/lib
  cp -a ./posegraph2.hh ./treeoptimizer2.hh ./posegraph3.hh ./treeoptimizer3.hh $pkgdir/usr/include
  cp -ar ./doc/html $pkgdir/usr/share/doc/toro
  #install -Dm644 ./license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
