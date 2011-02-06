# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=linux-uvc-utils-svn
pkgver=11
pkgrel=1
pkgdesc="Userspace utility required by linux-uvc-svn"
arch=('i686' 'x86_64')
url="http://linux-uvc.berlios.de"
license=('GPL')
depends=('python')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=svn://svn.berlios.de/linux-uvc/uvc-utils/trunk
_svnmod=uvc-utils

build() {
  cd $startdir/src
  msg "Connecting to SVN server..."
  msg "Checking out $_svnmod"
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod 
  msg "SVN checkout done or server timeout"
  install -D -m755 mjpeg2jpeg.py $startdir/pkg/usr/bin/mjpeg2jpeg.py
}
