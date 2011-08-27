# Contributor: Carl Mueller  arch at carlm e4ward com

pkgname=emailnotify-plasmoid-svn
pkgver=61
pkgrel=1
pkgdesc="Kdeplasma email notification plasmoid"
url="http://code.google.com/p/emailnotify/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace')
makedepends=('subversion' 'automoc4' 'cmake')
conflicts=('emailnotify-plasmoid')
provides=('emailnotify-plasmoid')
source=()
md5sums=()
_svntrunk=http://emailnotify.googlecode.com/svn/trunk/
_svnmod=emailnotify-read-only

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release .
  make || return 1
  make DESTDIR=$pkgdir install
}
