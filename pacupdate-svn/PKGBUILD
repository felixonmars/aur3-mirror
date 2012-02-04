pkgname=pacupdate-svn
pkgver=44
pkgrel=2
pkgdesc="A simple update notifier for Arch Linux (pacman)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pacupdate/"
license=('GPL2')
depends=('python-notify' 'notification-daemon' 'pygtk>=2.13' 'sudo' 'pacman>=3.2' 'python2')
makedepends=('subversion')
source=()
md5sums=()
install=pacupdate.install

_svntrunk="http://pacupdate.googlecode.com/svn/trunk/"
_svnmod="pacupdate"

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Preparing..."

  [ -d $srcdir/$_svnmod-build ] && rm -r $srcdir/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting build ..."
  
  python2 setup.py build
  python2 setup.py install --prefix=${pkgdir}/usr
}
