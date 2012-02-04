# Contributor: Marco Siviero <marcosiviero.mobile@gmail.com>

pkgname=qwit-tosate-svn
pkgver=253
pkgrel=1
pkgdesc="Qt4 cross-platform client for Twitter; tosate branch with followers management"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qwit/"
license=('GPL3')
depends=('qt' 'openssl')
provides=('qwit' 'qwit-svn')
conflicts=('qwit' 'qwit-svn')

_svnbranch=http://qwit.googlecode.com/svn/branches/tosate
_svnmod=qwit

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [ -d "$_svnmod/.svn" ] ; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn checkout $_svnbranch --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  qmake PREFIX=/usr || return 1
  make || return 1
  make INSTALL_ROOT="$pkgdir" install || return 1
}
