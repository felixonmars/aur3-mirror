# Contributor: tocer <tocer.deng@gmail.com>
pkgname=python-pyv8-svn
pkgver=247
pkgrel=1
pkgdesc="a python wrapper for Google V8 javascript engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyv8/"
license=(APACHE)
depends=('python')
makedepends=('subversion' 'v8-static-svn')
provides=()
conflicts=(python-pyv8)
replaces=()
backup=()
options=()
install=
noextract=()
_svntrunk=http://pyv8.googlecode.com/svn/trunk/
_svnmod=pyv8
md5sums=()

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

  #
  # BUILD
  #
  export V8_HOME=/usr/lib/v8
  python setup.py install --root=$pkgdir/ || return 1
}
