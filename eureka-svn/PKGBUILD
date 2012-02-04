# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: adriano <adriano.src@gmail.com>
pkgname=eureka-svn
pkgver=53
pkgrel=1
pkgdesc="A lightweight web browser based on KDE"
arch=('i686' 'x86_64')
url="http://code.google.com/p/eurekabrowser/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake' 'subversion')
provides=('eureka=0.5')
conflicts=('eureka')
source=()
md5sums=()

_svntrunk="http://eurekabrowser.googlecode.com/svn/trunk/"
_svnmod="eureka"

build() {
  cd "$srcdir"

  msg "Connecting to $_svntrunk..."
  if [ -d "$_svnmod/.svn" ]; then
    cd $_svnmod && svn up
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  msg "Starting make..."
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release . || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  install -Dm644 src/eurekaui.rc "$pkgdir/opt/kde/share/apps/eureka/eurekaui.rc"
}
