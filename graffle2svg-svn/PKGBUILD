# Maintainer: fmjrey
pkgname=graffle2svg-svn
pkgver=29
pkgrel=1
pkgdesc="Basic converter from omnigraffle (.graffle file) to svg"
arch=(any)
url="http://graffle2svg.googlecode.com"
license=('New BSD License')
depends=('python2')
provides=('graffle2svg')
conflicts=('graffle2svg')

_svntrunk=http://graffle2svg.googlecode.com/svn/trunk/
_svnmod=graffle2svg

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
