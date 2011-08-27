pkgname=gfarm2
_realname=gfarm_v2
pkgver=3888
pkgrel=1
pkgdesc="Gfarm file system is a next-generation network shared file system, which will be an alternative solution of NFS, and will meet a demand for much larger, much reliable, and much faster file system."
url="http://datafarm.apgrid.org/"
depends=('bzip2' 'openssl' 'postgresql')
makedepends=('subversion')
arch=('i686')
#conflicts=('python')
#provides=('python')
license=('BSD')
source=()
md5sums=()
_svntrunk=https://gfarm.svn.sourceforge.net/svnroot/gfarm/gfarm/branches/$_realname
_svnmod=$_realname

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./configure  --prefix=/usr --sysconfdir=/etc --with-postgresql=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
