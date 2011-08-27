# Contributor: Juan Diego Tascón

pkgname=seom-svn
pkgver=192
pkgrel=1
pkgdesc="Helper library for yukon, a screencapture solution for gaming."
arch=(i686)
license=('GPL')
url="https://devel.neopsis.com/projects/yukon/"
depends=('libgl' 'libx11')
makedepends=('subversion' 'yasm')
conflicts=('seom')
provides=('seom')

source=()
md5sums=()

_svntrunk=https://devel.neopsis.com/svn/seom/trunk
_svnmod=seom

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
  
  ./configure --prefix="/usr" || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:syntax=sh
