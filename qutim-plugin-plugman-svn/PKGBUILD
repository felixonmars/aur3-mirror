# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-plugman-svn
pkgver=151
pkgrel=1
pkgdesc="Plugin manager for Qutim. SVN version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim-svn')
makedepends=('subversion' 'gcc' 'make' 'cmake')

_svnmod=plugman
_svntrunk=http://qutim.org/svn/$_svnmod/trunk

build() {
msg "Downloading from $_svntrunk ..."
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg2 "SVN checkout done or server timeout"

msg "Creating temporary build directory..."
  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $srcdir/$_svnmod-build

msg "Building and installing..."  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $srcdir
msg "Removing temporary files..."
  rm -rf $_svnmod-build
}
