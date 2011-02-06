# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
# Contributor: Alper Kanat <alperkanat+aur@raptiye.org>
pkgname=trac-spamfilter-svn
pkgver=10212
pkgrel=1
pkgdesc="Trac Spam Filtering Plugin"
arch=('i686' 'x86_64')
url="http://trac.edgewall.org/wiki/SpamFilter"
license=('GPL')
depends=("trac>=0.11")
makedepends=('python' 'setuptools')
install=spamfilter.install

_svntrunk=http://svn.edgewall.com/repos/trac/plugins/0.12/spam-filter-captcha
_svnmod=spam-filter

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
  python setup.py build || return 1
  python setup.py install --root=${pkgdir} || return 1
}
