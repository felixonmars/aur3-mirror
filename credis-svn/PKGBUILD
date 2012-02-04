# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=credis-svn
pkgver=59
pkgrel=1
pkgdesc="A client library in plain C for communicating with Redis servers."
arch=('i686' 'x86_64')
url="http://credis.googlecode.com/"
license=('BSD')
depends=('glibc')
makedepends=('subversion')

_svntrunk=http://credis.googlecode.com/svn/trunk/
_svnmod=credis

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir/" prefix="/usr" install
}

