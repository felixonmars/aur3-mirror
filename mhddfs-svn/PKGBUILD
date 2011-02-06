# Contributor: Michail "mnk" Pavlenko <maniak.net [at] gmail [dot] com>
pkgname=mhddfs-svn
pkgver=194
pkgrel=1   
pkgdesc="A FUSE module that combines a several mount points into the single one. SVN version."
arch=('i686' 'x86_64')
url="http://svn.uvw.ru/mhddfs/trunk/README"
license=('GPL3')
depends=('fuse')
makedepends=('subversion' 'gcc' 'glibc')
conflicts=('mhddfs')
source=()
md5sums=()

_svntrunk=http://svn.uvw.ru/mhddfs/trunk
_svnmod=mhddfs

build() {

  cd $startdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  make
  cp ./mhddfs /usr/bin
}
