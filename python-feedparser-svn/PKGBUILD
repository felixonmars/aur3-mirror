# Maintainer: Simon Lipp <sloonz@gmail.com>

pkgname=python-feedparser-svn
pkgver=325
pkgrel=1
pkgdesc="Parse RSS and Atom feeds in Python [SVN version]"
arch=(any)
url="http://www.feedparser.org/"
license=('BSD')
depends=('python-lxml')
makedepends=('python2-distribute' 'subversion')
conflicts=('python-feedparser')
provides=('python-feedparser')
source=()
md5sums=()

_svntrunk=https://feedparser.googlecode.com/svn/trunk/feedparser
_svnmod=feedparser

build() {
  cd "$srcdir" || return 1

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver && cd ..) || return 1
  else
    svn co $_svntrunk --config-dir ./ $_svnmod || return 1
  fi
  
  cd feedparser &&
  python2 setup.py install -O2 --root="$pkgdir" || return 1
}
