#Contributor: Bruno Galeotti <bravox87 at gmail.com>
pkgname=memcached-manager-svn
pkgver=123
pkgrel=1
pkgdesc='A Simple Memcached Server Manager.'
arch=(i686 x86_64)
url='http://code.google.com/p/memcached-manager/'
license=('custom')
depends=('python-matplotlib' 'python-numpy')
makedepends=('python2' 'subversion')
provides=('memcached-manager')
conflicts=('memcached-manager')

_svntrunk=http://memcached-manager.googlecode.com/svn/trunk/
_svnmod=memcached-manager

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"

  if [ -d $_svnmod-build ]; then
    msg 'Removing old build directory'
    rm -rf $_svnmod-build
  fi
  
  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  
  msg 'Starting build'
  cd $srcdir/$_svnmod-build/src

  msg 'Running setup.py'
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}
