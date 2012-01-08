# Contributor: ahmad200512@yandex.ru
pkgname=tinygettext-svn
pkgver=200
pkgrel=1
pkgdesc="A simple gettext replacement that works directly on .po files"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tinygettext/"
license=('GPL2')
makedepends=('subversion' 'cmake')
provides=('tinygettext')
conflicts=('tinygettext')

source=()
md5sums=()

_svntrunk=http://tinygettext.googlecode.com/svn/trunk/
_svnmod=tinygettext

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
  cd $_svnmod-build

  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

