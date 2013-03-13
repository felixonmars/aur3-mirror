# Contributor: Feng Wang <wanng.fenng at gmail.com>

pkgname=mtl4-svn
pkgname_=mtl4
pkgver=9149
pkgrel=1
pkgdesc="A Matrix Template Library in C++"
arch=('any')
url="http://www.mtl4.org"
license=('BSD')
depends=()
makedepends=()
provides=()
options=()
source=()
md5sums=()

_svntrunk=https://simunova.zih.tu-dresden.de/svn/mtl4/trunk
_svnmod=mtl4

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
  (cd $_svnmod && svn up -r $pkgver)
  else
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  install -d $pkgdir/usr/include/boost 

  cp -r $srcdir/$pkgname_/boost/* $pkgdir/usr/include/boost 
  
  find ${pkgdir}/ -type d -iname ".svn" -print0 | xargs -0 /bin/rm -fr 
}
