# Maintainer: Denis Kobozev <d.v.kobozev at gmail dot com>

pkgname=openrave-svn
pkgver=3484
pkgrel=1
url="http://openrave.org"
pkgdesc="An environment for testing, developing, and deploying motion planning algorithms in real-world robotics applications."
arch=('i686' 'x86_64')
depends=('boost' 'soqt' 'bullet' 'ffmpeg' 'python2-numpy' 'python2-sympy'
         'python2-h5py' 'ode' 'collada-dom' 'assimp' 'mpfr' 'openscenegraph')
makedepends=('svn' 'cmake')
optdepends=('cmake: plugin compilation'
            'qhull')
license=('LGPL' 'Apache')

_svntrunk=https://openrave.svn.sourceforge.net/svnroot/openrave/trunk
_svnmod=openrave

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn  ]; then
      (cd $_svnmod && svn up) || return 1
  else
      svn co $_svntrunk -r $pkgver $_svnmod || return 1
  fi

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cmake . \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \

  make
  make install DESTDIR=$pkgdir
}
