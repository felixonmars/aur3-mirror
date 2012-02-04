# Contributor:  Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=pigment-python-svn
pkgver=1219
pkgrel=1
pkgdesc="Pigment is a 3D scene graph library designed to easily create rich application user interfaces."
url="https://code.fluendo.com/pigment/trac"
arch=(i686 x86_64)
license=('GPL')

depends=('pigment-svn' 'python')
makedepends=('subversion')
conflicts=('python-pigment')
options=('!libtool' '!makeflags')
provides=('pigment-python-svn')

source=()
md5sums=()

_svntrunk="https://code.fluendo.com/pigment/svn/trunk/pigment-python"
_svnmod="pigment-python"

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
