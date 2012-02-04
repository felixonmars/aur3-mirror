# Contributor: Cochise Cesar <cochisepoeta@gmail.com>

pkgname=qwit-ng
pkgver=213
pkgrel=1
pkgdesc="Qt4 cross-platform client for Twitter - branch is the most atual with new features"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qwit/"
license=('GPL3')
depends=('qt' 'openssl')
provides=('qwit')
conflicts=('qwit')
replaces=('qwit')

_svntrunk=http://qwit.googlecode.com/svn/branches/ng/
_svnmod=qwit

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [ -d "$_svnmod/.svn" ] ; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn checkout $_svntrunk --config-dir ./ -r $pkgver $_svnmod
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
