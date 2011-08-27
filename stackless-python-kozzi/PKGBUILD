arch=('i686')
pkgname=stackless-python-kozzi
_realname=stackless-python
pkgver=59878
pkgrel=1
pkgdesc="Python is a high-level scripting language. Stackless is an experimental implementation that supports continuations, generators, microthreads, and coroutines"
url="http://www.stackless.com"
depends=('db' 'bzip2' 'gdbm' 'openssl')
makedepends=('tk' 'subversion')
conflicts=('python')
provides=('python')
license=('GPL')
source=()
md5sums=()

_svntrunk=http://svn.python.org/projects/stackless/branches/release25-maint/
_svnmod=release25-maint

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh
  ./configure --prefix=/usr --with-threads
  make || return 1
  make DESTDIR=$startdir/pkg install
}
