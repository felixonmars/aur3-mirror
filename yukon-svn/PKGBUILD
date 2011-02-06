# Contributor: Stefan Lohmaier <noneuss@gmail.com>
# Contributor (since 9 jun 2010): Juan Diego Tascon

pkgname=yukon-svn
pkgver=155
pkgrel=1
pkgdesc="A Screencapture solution for gaming."
arch=(i686)
license=('GPL')
url="https://devel.neopsis.com/projects/yukon/"
depends=('libgl' 'libx11' 'seom-svn')
makedepends=('subversion' 'yasm')
conflicts=('yukon')
provides=('yukon')
source=()
md5sums=()

_svntrunk=https://devel.neopsis.com/svn/yukon/trunk
_svnmod=yukon

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
  install -D sysconf $pkgdir/etc/yukon/system/sysconf
}

# vim:syntax=sh
