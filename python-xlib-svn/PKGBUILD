# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig AT har-ikkje.net>
pkgname=python-xlib-svn
pkgver=139
pkgrel=1
pkgdesc="Python xlib library."
arch=(i686 x86_64)
url="http://python-xlib.sourceforge.net/"
license=('GPL')
depends=('python2' 'libx11')
makedepends=('python2' 'subversion')
provides=('python-xlib')
conflicts=('python-xlib')
source=()
md5sums=()

_svntrunk='https://python-xlib.svn.sourceforge.net/svnroot/python-xlib/trunk'
_svnmod='python-xlib'

build() {
  cd "$srcdir"
  
  # svn crud
  msg "Starting SVN checkout"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Preparing sources..."

  if [ -d $srcdir/$_svnmod-build ] ; then
    rm -rf "$srcdir/$_svnmod-build"
  fi
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # build
  msg "Running setup.py"
  python2 setup.py install --root=$pkgdir --prefix=/usr
}


