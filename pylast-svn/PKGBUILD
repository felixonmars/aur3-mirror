# Contributor: superbobry <superbobry@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=pylast-svn
pkgver=1    # Automatically updated
pkgrel=1
pkgdesc="A Python interface to the Last.fm (and other compatible websites) API"
url="http://code.google.com/p/pylast/"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('python')
makedepends=('subversion')
conflicts=('pylast' 'pylast-0.3.4')
provides=('pylast')

source=()
md5sums=()

_svntrunk=http://pylast.googlecode.com/svn/trunk/
_svnmod=pylast

build() {
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  cd ${_svnmod}
  python setup.py install --root=$startdir/pkg || return 1
}
